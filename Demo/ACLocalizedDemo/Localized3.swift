//
//  Localized3.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation
import UIKit

extension Localized {
    
    static func test() -> Self {
        .init("test", "Localized")
    }
    
    static func change_localized() -> Self {
        .init("change_localized", "Localized")
    }
    
}

protocol LocalizedObject: AnyObject {
    var identifer: String { get }
    
    func localize()
}

extension LocalizedObject where Self: NSObject {
    
    var identifer: String {
        self.hash.description
    }
    
}

struct LocalizedPicker {
    
    init(_ object: LocalizedObject, property: LocalizedPropertyTypeProtocol, localized: Localized?) {
        self.object = object
        self.property = property
        self.localized = localized
        self.localizedStringAttributed = nil
    }
    
    init(_ object: LocalizedObject, property: LocalizedPropertyTypeProtocol, localizedStringAttributed: LocalizedStringAttributed?) {
        self.object = object
        self.property = property
        self.localized = nil
        self.localizedStringAttributed = localizedStringAttributed
    }
    
    weak var object: LocalizedObject?
    let property: LocalizedPropertyTypeProtocol
    let localized: Localized?
    let localizedStringAttributed: LocalizedStringAttributed?
    
    func localize() {
        self.object?.localize()
    }
}

enum LocalizedStorage {
    private static var pickers: [LocalizedPicker] = []
    
    static func getPicker(object: LocalizedObject, property: LocalizedPropertyTypeProtocol) -> LocalizedPicker? {
        self.pickers.first { picker in
            picker.object?.identifer == object.identifer && picker.property.identifer == property.identifer
        }
        
    }
    
    static func setPicker(_ picker: LocalizedPicker) {
//        if let index = self.pickers.firstIndex(where: { $0.identifer == picker.identifer }) {
//            self.pickers.remove(at: index)
//        }
        
        self.pickers += [picker]
        picker.localize()
    }
}

protocol LocalizedPropertyTypeProtocol {
    var identifer: String { get }
}

extension UILabel: LocalizedObject {
    
    enum LocalizedPropertyType: LocalizedPropertyTypeProtocol {
        case text
        case attributedText
        
        var identifer: String {
            switch self {
            case .text:
                return "text"
            case .attributedText:
                return "attributedText"
            }
        }
    }
    
    func localize() {
        if let attributedTextLocalized = self.attributedTextLocalized {
            self.attributedText = attributedTextLocalized.attributedString
        }
        
        if let textLocalized = self.textLocalized {
            self.text = textLocalized.toLocalizedString()
        }
    }
    
    var attributedTextLocalized: LocalizedStringAttributed? {
        get { LocalizedStorage.getPicker(object: self, property: LocalizedPropertyType.attributedText)?.localizedStringAttributed }
        set { LocalizedStorage.setPicker(.init(self, property: LocalizedPropertyType.attributedText, localizedStringAttributed: newValue)) }
    }
    
    var textLocalized: Localized? {
        get { LocalizedStorage.getPicker(object: self, property: LocalizedPropertyType.text)?.localized }
        set { LocalizedStorage.setPicker(.init(self, property: LocalizedPropertyType.text, localized: newValue)) }
    }
    
}

protocol LocalizedStringAttributedComponent {
    func toString() -> String
}

extension Localized: LocalizedStringAttributedComponent {
    
    func toString() -> String {
        self.toLocalizedString()
    }
    
}

extension String: LocalizedStringAttributedComponent {
    
    func toString() -> String {
        self
    }
    
}

extension Array where Element == LocalizedStringAttributedComponent {
    
    func toString() -> String {
        self.reduce("", { $0 + $1.toString() })
    }
    
}
 
struct LocalizedStringAttributed {
    
    // MARK: - Init
    init(_ components: [LocalizedStringAttributedComponent], attributes: [NSAttributedString.Key: Any]?) {
        self.components = components
        self.attributedString = .init(string: components.toString(), attributes: attributes)
    }
    
    // MARK: - Props
    private(set) var components: [LocalizedStringAttributedComponent]
    private(set) var attributedString: NSMutableAttributedString
    
    // MARK: - Methods
    mutating func appendString(_ string: LocalizedStringAttributed) {
        let attributedString = self.attributedString
        attributedString.append(string.attributedString)
        self.components += string.components
        self.attributedString = attributedString
    }
    
    mutating func localized() {
        self.attributedString = .init(string: self.components.toString(), attributes: self.attributedString.attributes(at: 0, effectiveRange: nil))
    }
    
}
