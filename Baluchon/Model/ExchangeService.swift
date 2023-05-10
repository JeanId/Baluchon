//
//  ExchangeService.swift
//  Baluchon
//
//  Created by Jean Barottin on 10/04/2023.
//

import Foundation

class ExchangeService {
    static var shared = ExchangeService()
    private init() {}
    
    private static let exchangeUrl = URL(string: exchangeUrlString)!
    
    private var currenciesRates: [Float] = []
    private var session = URLSession(configuration: .default)
    
    init(session: URLSession) {
        self.session = session
    }
    
    
    func getExchange(_ amount: Float, callback: @escaping (Bool, Float?) -> Void) {
        if let currencies = (UserDefaults.standard.object(forKey: userKey02) as? [Float]) {
            currenciesRates = currencies
            let timestamp = UserDefaults.standard.double(forKey: userKey03)
            if isToUpdate(since: timestamp) {
            } else {
                let result = amount * currenciesRates[SettingService.shared.getCurrencyRow()]
                callback(true, result)
                return
            }
        }
            
        var request = URLRequest(url: ExchangeService.exchangeUrl)
        request.httpMethod = "GET"
        //request.addValue(exchangeToken, forHTTPHeaderField: "apikey")
        request.allHTTPHeaderFields = ["apikey":exchangeToken]
        
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    // Si on devait gérer l’erreur, ce serait ici
                    print("Erreur data")
                    callback(false, nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    // gérer ici l’erreur de status code
                    print("erreur response")
                    callback(false, nil)
                    return
                }
                
                //print(response)
                print(data)
                do {
                    let exchangeT = try JSONDecoder().decode(ExchangeTable.self, from: data)
                    self.saveCurrenciesRates(for: exchangeT)
                    let result = amount * self.currenciesRates[SettingService.shared.getCurrencyRow()]
                    callback(true, result)
                    
                } catch let error {
                    print(error)
                    callback(false, nil)
                }
            }
            
        }
        
        task.resume()
    }
    
    
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
    
    private func isToUpdate(since timeStamp: Double) -> Bool {
        let lastUrlStamp = Date(timeIntervalSince1970: timeStamp)
        let urlStampLimit = lastUrlStamp.addingTimeInterval(86400)
        let now = Date()
        return now > urlStampLimit
    }
}
