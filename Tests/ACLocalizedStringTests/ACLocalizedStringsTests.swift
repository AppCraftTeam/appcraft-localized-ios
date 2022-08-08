//
//  ACLocalizedStringsTests.swift
//  
//
//  Created by Дмитрий Поляков on 05.07.2022.
//

import XCTest
@testable import ACLocalized

final class ACLocalizedStringsTests: XCTestCase {
    
    // MARK: - Props
    private let localizedString = ACLocalizedString(stringLiteral: "Test")
    private let localizedAttributedString = ACLocalizedAttributedString(string: "Test", attributes: [ .foregroundColor: UIColor.red ])
    private let testLocalizedKeyString = ACLocalizedKeyString(key: "test_string", table: "Localized")
    
    private func testsLocalizedKeyString(_ count: Int) -> ACLocalizedKeyString {
        ACLocalizedKeyString(key: "tests", table: "Localized", args: count)
    }
    
    // MARK: - Methods
    func testACLocalizedString() throws {
        let testedValue = self.localizedString.toString()
        let correctValue = "Test"
        XCTAssertEqual(testedValue, correctValue)
    }
    
    func testACLocalizedAttributedString() throws {
        let testedValue = self.localizedAttributedString.toAttributedString()
        let correctValue = NSAttributedString(string: "Test", attributes: [ .foregroundColor: UIColor.red ])
        XCTAssertEqual(testedValue, correctValue)
    }
    
    func testACLocalizedKeyStrings() throws {
        ACLocalizedCore.shared.coreBundle = Bundle.module
        
        ACLocalizedCore.shared.language = .en
        let testedValueEn = self.testLocalizedKeyString.toString()
        let correctValueEn = "Test string"
        XCTAssertEqual(testedValueEn, correctValueEn)
        
        ACLocalizedCore.shared.language = .ru
        let testedValueRu = self.testLocalizedKeyString.toString()
        let correctValueRu = "Тестовая строка"
        XCTAssertEqual(testedValueRu, correctValueRu)
        
        ACLocalizedCore.shared.language = .en
        let testedValuePluralEn = self.testsLocalizedKeyString(11).toString()
        let correctValuePluralEn = "tests"
        XCTAssertEqual(testedValuePluralEn, correctValuePluralEn)
        
        ACLocalizedCore.shared.language = .ru
        let testedValuePluralRu = self.testsLocalizedKeyString(5).toString()
        let correctValuePluralRu = "тестов"
        XCTAssertEqual(testedValuePluralRu, correctValuePluralRu)
    }
    
    func testCompositionLocalizedStrings() throws {
        ACLocalizedCore.shared.coreBundle = Bundle.module
        
        let localizedString = ACLocalizedString(strings: [
            self.localizedString,
            self.localizedAttributedString,
            self.testLocalizedKeyString,
            self.testsLocalizedKeyString(2)
        ])
        
        ACLocalizedCore.shared.language = .en
        
        let testedValueStringEn = localizedString.toString()
        let correctValueStringEn = "TestTestTest stringtests"
        XCTAssertEqual(testedValueStringEn, correctValueStringEn)
        
        let testedValueAttributedStringEn = localizedString.toAttributedString()
        let correctValueAttributedStringEn = NSMutableAttributedString(string: correctValueStringEn)
        correctValueAttributedStringEn.addAttributes([ .foregroundColor: UIColor.red ], range: NSRange(location: 4, length: 4))
        XCTAssertEqual(testedValueAttributedStringEn, correctValueAttributedStringEn)
        
        ACLocalizedCore.shared.language = .ru
        let testedValueStringRu = localizedString.toString()
        let correctValueStringRu = "TestTestТестовая строкатеста"
        XCTAssertEqual(testedValueStringRu, correctValueStringRu)
        
        let testedValueAttributedStringRu = localizedString.toAttributedString()
        let correctValueAttributedStringRu = NSMutableAttributedString(string: correctValueStringRu)
        correctValueAttributedStringRu.addAttributes([ .foregroundColor: UIColor.red ], range: NSRange(location: 4, length: 4))
        XCTAssertEqual(testedValueAttributedStringRu, correctValueAttributedStringRu)
    }
    
}
