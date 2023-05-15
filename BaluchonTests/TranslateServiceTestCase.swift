//
//  TranslateServiceTestCase.swift
//  BaluchonTests
//
//  Created by Jean Barottin on 11/05/2023.
//
@testable import Baluchon
import XCTest

final class TranslateServiceTestCase: XCTestCase {

    func testGetTranslateeShouldPostFailedCallbackIfError() {
        //Given
        let translateService = TranslateService(session: URLSessionFake(data: nil, response: nil, error: FakeTranslateResponseData.error))
        
        //When
        translateService.getTranslate("Hello guys !", callback: {success, result in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(result)
        })
    }
    
    func testGetTranslateeShouldPostFailedCallbackIfResponseKo() {
        //Given
        let translateService = TranslateService(session: URLSessionFake(data: nil, response: FakeTranslateResponseData.responseKo, error: nil))
        
        //When
        translateService.getTranslate("Hello guys !", callback: {success, result in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(result)
        })
    }
    
    func testGetTranslateeShouldPostFailedCallbackIfNoData() {
        //Given
        let translateService = TranslateService(session: URLSessionFake(data: nil, response: FakeTranslateResponseData.responseOk, error: nil))
        
        //When
        translateService.getTranslate("Hello guys !", callback: {success, result in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(result)
        })
    }
    
    func testGetTranslateeShouldPostFailedCallbackIfIncorrectData() {
        //Given
        let translateService = TranslateService(session: URLSessionFake(data: FakeTranslateResponseData.incorrectData, response: nil, error: nil))
        
        //When
        translateService.getTranslate("Hello guys !", callback: {success, result in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(result)
        })
    }
    
    func testGetTranslateeShouldPostSucceed() {
        //Given
        let translateService = TranslateService(session: URLSessionFake(data: FakeTranslateResponseData.correctData, response: FakeTranslateResponseData.responseOk, error: nil))
        
        //When
        translateService.getTranslate("Hello guys !", callback: {success, result in
            //Then
            XCTAssertTrue(success)
            XCTAssertNotNil(result)
        })
    }

}
