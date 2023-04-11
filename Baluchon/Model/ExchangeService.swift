//
//  ExchangeService.swift
//  Baluchon
//
//  Created by Jean Barottin on 10/04/2023.
//

import Foundation

class ExchangeService {
    private static let exchangeUrl = URL(string: "https://api.apilayer.com/fixer/latest")!
    private static let exchangeToken = "OU0mEkSD0rq7cDC4ZnYLOsnCp3Y7DirG"
    struct ExchangeTable: Codable {
        let success : Bool
        let timeStamp : Int64
        let base : String?
        let date : String?
        //let rates: String?
    }
    
    static func getExchange() {
        var request = URLRequest(url: exchangeUrl)
        request.httpMethod = "GET"
        //request.addValue(exchangeToken, forHTTPHeaderField: "apikey")
        request.allHTTPHeaderFields = ["apikey":exchangeToken]
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    // Si on devait gérer l’erreur, ce serait ici
                    print("Erreur data")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    // gérer ici l’erreur de status code
                    print("erreur response")
                    return
                }
                
                //print(response)
                print(data)
                
                guard let exchangeTable = try? JSONDecoder().decode(ExchangeTable.self, from: data) else {
                   // gérer l’erreur de décodage
                    print("Erreur décodage data")
                   return
                }
                
                print(exchangeTable.date!)
                
               /* guard let rate = try? JSONDecoder().decode([String: Float].self, from: ) else {
                   // gérer l’erreur ici
                    print("Erreur décodage rates")
                   return
                }
                guard let taux = rate["USD"], let base = exchangeTable.base else {
                   // gérer l’erreur ici
                    print("Erreur décodage exchangeTable")
                   return
                }
                print("Taux de change USD : \(taux)")
                print("base : \(base)") */
            }
            
        }
        
        task.resume()
    }
}
