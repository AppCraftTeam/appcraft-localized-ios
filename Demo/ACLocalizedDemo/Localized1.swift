//
//  Localized1.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 30.03.2022.
//

import Foundation

//protocol LocalizedPropertyTypeProtocol {
//    var identifer: String { get }
//}
//
//protocol Localizable: AnyObject {
//    var identifer: String { get }
//    func localize(propertyType: LocalizedPropertyTypeProtocol, string: Localized?)
//}
//
//extension Localizable where Self: NSObjectProtocol {
//
//    var identifer: String {
//        String(self.hash)
//    }
//
//}
//
//protocol LocalizedLanguageProtocol {
//    var rawValue: String { get }
//
//    init?(rawValue: String)
//}
//
//struct Localized {
//
//    init(_ key: String, _ table: String, _ args: CVarArg...) {
//        self.key = key
//        self.table = table
//        self.args = args
//    }
//
//    let key: String
//    let table: String
//    let args: [CVarArg]
//
//    func toLocalizedString() -> String {
//        let format = LocalizedSettings.langBundle.localizedString(forKey: self.key, value: nil, table: self.table)
//        return String(format: format, locale: Locale.current, arguments: self.args)
//    }
//}
//
//extension UILabel: Localizable {
//
//    enum LocalizedPropertyType: String, LocalizedPropertyTypeProtocol {
//        case text
//
//        var identifer: String {
//            self.rawValue
//        }
//    }
//
//    func localize(propertyType: LocalizedPropertyTypeProtocol, string: Localized?) {
//        guard let propertyType = propertyType as? LocalizedPropertyType else { return }
//        let localizedString = string?.toLocalizedString()
//
//        switch propertyType {
//        case .text:
//            self.text = localizedString
//        }
//    }
//
//    var textLocalized: Localized? {
//        get { LocalizedSettings.getPicker(for: .init(object: self, type: LocalizedPropertyType.text))?.string }
//        set { LocalizedSettings.setPicker(for: .init(object: self, type: LocalizedPropertyType.text), string: newValue) }
//    }
//
//}
//
//struct LocalizedPropertyPicker {
//    var closure: () -> Void
//    weak var object: Localizable?
//}
//
//extension UIButton: Localizable {
//
//    enum LocalizedPropertyType: LocalizedPropertyTypeProtocol {
//        case setTitle(state: UIControl.State)
//
//        var identifer: String {
//            switch self {
//            case let .setTitle(state):
//                return "setTitle\(state.rawValue)"
//            }
//        }
//    }
//
//    func localize(propertyType: LocalizedPropertyTypeProtocol, string: Localized?) {
//        guard let propertyType = propertyType as? LocalizedPropertyType else { return }
//        let localizedString = string?.toLocalizedString()
//
//        switch propertyType {
//        case let .setTitle(state):
//            self.setTitle(localizedString, for: state)
//        }
//    }
//
//    func setTitleLocalized(_ localizedString: Localized, for state: UIControl.State) {
//        LocalizedSettings.setPicker(for: .init(object: self, type: LocalizedPropertyType.setTitle(state: state)), string: localizedString)
//    }
//
//    func getTitleLocalized(for state: UIControl.State) -> Localized? {
//        LocalizedSettings.getPicker(for: .init(object: self, type: LocalizedPropertyType.setTitle(state: state)))?.string
//    }
//
//}
//
//struct LocalizedObjectProperty {
//    weak var object: Localizable?
//    let type: LocalizedPropertyTypeProtocol
//}
//
//struct LocalizedPicker {
//    let property: LocalizedObjectProperty
//    let string: Localized
//}
//
//extension Array where Element == LocalizedPicker {
//
//    func first(for property: LocalizedObjectProperty) -> Element? {
//        self.first(where: {
//            $0.property.object?.identifer == property.object?.identifer &&
//            $0.property.type.identifer == property.type.identifer
//        })
//    }
//
//    func firstIndex(for property: LocalizedObjectProperty) -> Int? {
//        self.firstIndex(where: {
//            $0.property.object?.identifer == property.object?.identifer &&
//            $0.property.type.identifer == property.type.identifer
//        })
//    }
//
//    mutating func remove(for property: LocalizedObjectProperty) {
//        guard let index = self.firstIndex(for: property) else { return }
//        self.remove(at: index)
//    }
//
//}
//
//struct LocalizedSettings {
//    private static var pickers: [LocalizedPicker] = []
//
//    static func setPicker(for property: LocalizedObjectProperty, string: Localized?) {
//        self.pickers.remove(for: property)
//
//        if let string = string {
//            self.pickers += [.init(property: property, string: string)]
//        }
//
//        property.object?.localize(propertyType: property.type, string: string)
//    }
//
//    static func getPicker(for property: LocalizedObjectProperty) -> LocalizedPicker? {
//        self.pickers.first(for: property)
//    }
//
//    static func localize() {
//        self.pickers.forEach({
//            $0.property.object?.localize(propertyType: $0.property.type, string: $0.string)
//        })
//    }
//
//    static var langSelected: LocalizedLang {
//        get {
//            if let identifer = UserDefaults.standard.string(forKey: "LocalizedManager_lang_identifer") {
//                return .init(identifer: identifer)
//            } else {
//                UserDefaults.standard.set("en", forKey: "LocalizedManager_lang_identifer")
//                return .en
//            }
//        }
//        set {
//            UserDefaults.standard.set(newValue.identifer, forKey: "LocalizedManager_lang_identifer")
//            self.localize()
//        }
//    }
//
//    static var langBundle: Bundle {
//        LocalizedBundle(langKey: self.langSelected.identifer).current
//    }
//
//}
//
//class LocalizedBundle {
//
//    init(langKey: String?) {
//        self.langKey = langKey
//    }
//
//    let langKey: String?
//
//    var current: Bundle {
//        if let key = self.langKey, let path = Bundle.main.path(forResource: key, ofType: "lproj"), let bundle = Bundle(path: path) {
//            return bundle
//        } else {
//            return Bundle(for: Self.self)
//        }
//    }
//
//}
//
//
//enum AppLang: String, LocalizedLanguageProtocol {
//    case en
//    case ru
//}
//
//struct LocalizedLang {
//    let identifer: String
//}
//
//extension LocalizedLang: Equatable {}
//
//extension LocalizedLang {
//    static let en = LocalizedLang(identifer: "en")
//    static let ru = LocalizedLang(identifer: "ru")
//}
//
//extension Localized {
//
//    static func test() -> Self {
//        .init("test", "Localized")
//    }
//
//    static func change_localized() -> Self {
//        .init("change_localized", "Localized")
//    }
//
//}
