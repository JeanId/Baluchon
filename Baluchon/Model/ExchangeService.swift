//
//  ExchangeService.swift
//  Baluchon
//
//  Created by Jean Barottin on 10/04/2023.
//

import Foundation



class ExchangeService  {
    static var shared = ExchangeService()
    private init() { }
    
    private static let exchangeUrl = URL(string: exchangeUrlString)!
    
    var currenciesRates: [Float] = []
    
    // MARK: - dependency injection
    private var session = URLSession(configuration: .default)
    init(session: URLSession) {
        self.session = session
    }
    
    // MARK: - launch network call to get the currencies rates Method
    func getExchange(_ amount: Float, callback: @escaping (Bool, Bool, Float?) -> Void) {
        // MARK: - recovery of recorded currencies rates
        if let currencies = (UserDefaults.standard.object(forKey: userKey02) as? [Float]) {
            currenciesRates = currencies
            
            let timestamp = UserDefaults.standard.double(forKey: userKey03)
                if isToUpdate(since: timestamp) {
                    // currencies rates must be updated
                } else {
                    // recorded currencies rates using
                    let result = amount * currenciesRates[SettingService.shared.getCurrencyRow()]
                    callback(false, true, result)
                    return
                }
        }
        // MARK: - API call preparation
        var request = URLRequest(url: ExchangeService.exchangeUrl)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["apikey":exchangeToken]
        let task = session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    callback(true, false, nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(true, false, nil)
                    return
                }
            
                do {
                        let exchangeT = try JSONDecoder().decode(ExchangeTable.self, from: data)
                        self.saveCurrenciesRates(for: exchangeT)
                        let result = amount * self.currenciesRates[SettingService.shared.getCurrencyRow()]
                        callback(true, true, result)
                    } catch let error {
                        print(error)
                        callback(true, false, nil)
                }
        }
        
        task.resume()
    }
    
    // MARK: - Save the daily currenties rates Method
    private func saveCurrenciesRates(for exchangeTable: ExchangeTable) {
        currenciesRates = []
        currenciesRates.append(exchangeTable.rates.ARS)
        currenciesRates.append(exchangeTable.rates.BOB)
        currenciesRates.append(exchangeTable.rates.BRL)
        currenciesRates.append(exchangeTable.rates.BTC)
        currenciesRates.append(exchangeTable.rates.CAD)
        currenciesRates.append(exchangeTable.rates.CHF)
        currenciesRates.append(exchangeTable.rates.CLP)
        currenciesRates.append(exchangeTable.rates.COP)
        currenciesRates.append(exchangeTable.rates.CRC)
        currenciesRates.append(exchangeTable.rates.CUC)
        currenciesRates.append(exchangeTable.rates.CUP)
        currenciesRates.append(exchangeTable.rates.DOP)
        currenciesRates.append(exchangeTable.rates.GBP)
        currenciesRates.append(exchangeTable.rates.GTQ)
        currenciesRates.append(exchangeTable.rates.MXN)
        currenciesRates.append(exchangeTable.rates.PEN)
        currenciesRates.append(exchangeTable.rates.RUB)
        currenciesRates.append(exchangeTable.rates.USD)
        UserDefaults.standard.set(currenciesRates, forKey: userKey02)
        UserDefaults.standard.set(exchangeTable.timestamp, forKey: userKey03)
    }
    
    // MARK: - test date if currencies rates must be updated Method
    private func isToUpdate(since timeStamp: Double) -> Bool {
        let lastUrlStamp = Date(timeIntervalSince1970: timeStamp)
        let urlStampLimit = lastUrlStamp.addingTimeInterval(86400)
        let now = Date()
        return now > urlStampLimit
    }
}
