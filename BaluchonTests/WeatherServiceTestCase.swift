//
//  WeatherServiceTestCase.swift
//  BaluchonTests
//
//  Created by Jean Barottin on 11/05/2023.
//
@testable import Baluchon
import XCTest

final class WeatherServiceTestCase: XCTestCase {

    func testGetCityWeatherShouldPostFailedCallbackIfError() {
        //Given
        let weatherService = WeatherService(session: URLSessionFake(data: nil, response: nil, error: FakeWeatherResponseData.error))
        
        //When
        weatherService.getCityWeather(cityAt: 1, callback: {success, result in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(result)
        })
    }
    
    func testGetCityWeatherShouldPostFailedCallbackIfResponseKo() {
        //Given
        let weatherService = WeatherService(session: URLSessionFake(data: nil, response: FakeWeatherResponseData.responseKo, error: nil))
        
        //When
        weatherService.getCityWeather(cityAt: 1, callback: {success, result in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(result)
        })
    }
    
    func testGetCityWeatherShouldPostFailedCallbackIfIncorrectData() {
        //Given
        let weatherService = WeatherService(session: URLSessionFake(data: FakeWeatherResponseData.incorrectData, response: nil, error: nil))
        
        //When
        weatherService.getCityWeather(cityAt: 1, callback: {success, result in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(result)
        })
    }
    
    func testGetCityWeatherShouldPostSucceed() {
        //Given
        let weatherService = WeatherService(session: URLSessionFake(data: FakeWeatherResponseData.correctData, response: FakeWeatherResponseData.responseOk, error: nil))
        
        //When
        weatherService.getCityWeather(cityAt: 1, callback: {success, result in
            //Then
            XCTAssertTrue(success)
            XCTAssertNotNil(result)
        })
    }
}
