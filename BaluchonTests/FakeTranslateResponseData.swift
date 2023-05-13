//
//  FakeTranslateResponseData.swift
//  BaluchonTests
//
//  Created by Jean Barottin on 11/05/2023.
//

import Foundation

class FakeTranslateResponseData {
    static let responseOk = HTTPURLResponse(url: URL(string: "https://api.apilayer.com/fixer/latest" )!,
                                            statusCode: 200, httpVersion: nil, headerFields: nil)
    
    static let responseKo = HTTPURLResponse(url: URL(string: "https://api.apilayer.com/fixer/latest" )!,
                                            statusCode: 500, httpVersion: nil, headerFields: nil)
    
    class ExchangeError: Error { }
    static let error = ExchangeError()
    
    static var correctData: Data {
        let bundle = Bundle(for: FakeTranslateResponseData.self)
        let url = bundle.url(forResource: "Translate", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static let incorrectData = "LaVérité".data(using: .utf8)!
}
