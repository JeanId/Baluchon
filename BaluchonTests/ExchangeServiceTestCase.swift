//
//  ExchangeServiceTestCase.swift
//  BaluchonTests
//
//  Created by Jean Barottin on 09/05/2023.
//

@testable import Baluchon
import XCTest

final class ExchangeServiceTestCase: XCTestCase {
    func testGetExchangeShouldGetSucceedCurrenciesDeleted() {
        //Given
        UserDefaults.standard.removeObject(forKey: userKey02)
        let exchangeService = ExchangeService(session: URLSessionFake(data: FakeExchangeResponseData.correctData, response: FakeExchangeResponseData.responseOk, error: nil))
        
        //When
        XCTAssertNil((UserDefaults.standard.object(forKey: userKey02) as? [Float]))
        exchangeService.getExchange(1.0, callback: {refresh, success, result in
            //Then
            
            XCTAssertTrue(refresh,"API call launched")
            XCTAssertEqual(exchangeService.currenciesRates.count, 18, accuracy: 0, "Currencies downloaded")
            XCTAssertTrue(success, "API response success")
            XCTAssertNotNil(result, "Result correct answer")
        })
        
       
        
    }
    
    func testGetExchangeShouldGettFailedCallbackIfError() {
        //Given
        let exchangeService = ExchangeService(session: URLSessionFake(data: nil, response: nil, error: FakeExchangeResponseData.error))
        
        //When
        let now = Date()
        let timeStampFake = now.addingTimeInterval(-86410)
        UserDefaults.standard.set(timeStampFake.timeIntervalSince1970, forKey: userKey03)
        exchangeService.getExchange(1.0, callback: {refresh, success, result in
            //Then
            XCTAssertTrue(refresh)
            XCTAssertEqual(exchangeService.currenciesRates.count, 18, accuracy: 0)
            XCTAssertFalse(success)
            XCTAssertNil(result)
        })
    }
    

    func testGetExchangeShouldGetFailedCallbackIfResponseKo() {
        //Given
        let exchangeService = ExchangeService(session: URLSessionFake(data: nil, response: FakeExchangeResponseData.responseKo, error: nil))
        //When
        let now = Date()
        let timeStampFake = now.addingTimeInterval(-86410)
        UserDefaults.standard.set(timeStampFake.timeIntervalSince1970, forKey: userKey03)
        exchangeService.getExchange(1.0, callback: {refresh, success, result in
            //Then
            XCTAssertTrue(refresh)
            XCTAssertFalse(success)
            XCTAssertNil(result)
        })
    }
    
    func testGetExchangeShouldGetFailedCallbackIfNoData() {
        //Given
        let exchangeService = ExchangeService(session: URLSessionFake(data: nil, response: FakeExchangeResponseData.responseOk, error: nil))
        //When
        let now = Date()
        let timeStampFake = now.addingTimeInterval(-86410)
        UserDefaults.standard.set(timeStampFake.timeIntervalSince1970, forKey: userKey03)
        exchangeService.getExchange(1.0, callback: {refresh, success, result in
            //Then
            XCTAssertTrue(refresh)
            XCTAssertFalse(success)
            XCTAssertNil(result)
        })
    }
    
    func testGetExchangeShouldGetFailedCallbackIfDataIncorrect() {
        //Given
        let exchangeService = ExchangeService(session: URLSessionFake(data: FakeExchangeResponseData.incorrectData, response: nil, error: nil))
        //When
        let now = Date()
        let timeStampFake = now.addingTimeInterval(-86410)
        UserDefaults.standard.set(timeStampFake.timeIntervalSince1970, forKey: userKey03)
        exchangeService.getExchange(1.0, callback: {refresh, success, result in
            //Then
            XCTAssertTrue(refresh)
            XCTAssertFalse(success)
            XCTAssertNil(result)
        })
    }
    
    func testGetExchangeShouldGetSucceed() {
        //Given
        let exchangeService = ExchangeService(session: URLSessionFake(data: FakeExchangeResponseData.correctData, response: FakeExchangeResponseData.responseOk, error: nil))
        //When
        UserDefaults.standard.set(17, forKey: userKey01)    // USD currency picked
        let now = Date()
        let timeStampFake = now.addingTimeInterval(-86410)
        UserDefaults.standard.set(timeStampFake.timeIntervalSince1970, forKey: userKey03)
        exchangeService.getExchange(1.0, callback: {refresh, success, result in
            let rate = exchangeService.currenciesRates[SettingService.shared.getCurrencyRow()]
            //Then
            XCTAssertTrue(refresh)
            XCTAssertTrue(success)
            XCTAssertNotNil(result)
            XCTAssertEqual(result, rate)
        })
    }
    
    func testGetExchangeShouldUnderLimitTime() {
        //Given
        print("Start test")
        let now = Date()
        UserDefaults.standard.removeObject(forKey: userKey03)
        UserDefaults.standard.set(now.timeIntervalSince1970, forKey: userKey03)
        let exchangeService = ExchangeService(session: URLSessionFake(data: FakeExchangeResponseData.correctData, response: FakeExchangeResponseData.responseOk, error: nil))
        
        //When
        print("UserDefaulte1 : \(UserDefaults.standard.double(forKey: userKey03))")
        exchangeService.getExchange(1.0, callback: {refresh, success, result in
            //Then
            XCTAssertFalse(refresh)
            XCTAssertEqual(exchangeService.currenciesRates.count, 18, accuracy: 0)
            XCTAssertTrue(success)
            XCTAssertNotNil(result)
        })
    }
    
    
   

}
