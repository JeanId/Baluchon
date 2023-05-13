//
//  SettingServiceTestCase.swift
//  BaluchonTests
//
//  Created by Jean Barottin on 13/05/2023.
//
@testable import Baluchon
import XCTest

final class SettingServiceTestCase: XCTestCase {
    func testSaveCurrencyGetCurrency() {
        //Given
        SettingService.shared.saveCurrency(at: 3)
    
        
        //When
        
            //Then
        XCTAssertEqual(3, SettingService.shared.getCurrencyRow(), "Test save and get")
    }
    
    func testSaveCity1GetCity1() {
        //Given
        SettingService.shared.saveCity1(at: 2)
    
        
        //When
        
            //Then
        XCTAssertEqual(2, SettingService.shared.getCity1Row(), "Test save and get")
    }
    
    func testSaveCity2GetCity2() {
        //Given
        SettingService.shared.saveCity2(at: 5)
    
        
        //When
        
            //Then
        XCTAssertEqual(5, SettingService.shared.getCity2Row(), "Test save and get")
    }
}
