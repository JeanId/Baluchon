//
//  ExchangeServiceTestCase.swift
//  BaluchonTests
//
//  Created by Jean Barottin on 09/05/2023.
//

@testable import Baluchon
import XCTest

final class ExchangeServiceTestCase: XCTestCase {
    func testGetExchangeShouldPostFailedCallbackIfError() {
        //Given
        let exchangeService = ExchangeService(session: URLSessionFake(data: nil, response: nil, error: FakeExchangeResponseData.error))
        //When
        let expectation = XCTestExpectation(description: "delay for queue change")
        exchangeService.getExchange(1.0, callback: { success, result in
            //Then
            XCTAssertTrue(success)
            XCTAssertNotNil(result)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
        
    }
    

    func testGetExchangeShouldPostFailedCallbackIfResponseKo() {
        //Given
        let exchangeService = ExchangeService(session: URLSessionFake(data: nil, response: FakeExchangeResponseData.responseKo, error: nil))
        //When
        let expectation = XCTestExpectation(description: "delay for queue change")
        exchangeService.getExchange(1.0, callback: { success, result in
            //Then
            XCTAssertTrue(success)
            XCTAssertNotNil(result)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetExchangeShouldPostFailedCallbackIfDataIncorrect() {
        //Given
        let exchangeService = ExchangeService(session: URLSessionFake(data: FakeExchangeResponseData.incorrectData, response: nil, error: nil))
        //When
        let expectation = XCTestExpectation(description: "delay for queue change")
        exchangeService.getExchange(1.0, callback: { success, result in
            //Then
            XCTAssertTrue(success)
            XCTAssertNotNil(result)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
