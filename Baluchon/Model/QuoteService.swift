//
//  QuoteService.swift
//  Baluchon
//
//  Created by Jean Barottin on 10/04/2023.
//

import Foundation

class QuoteService {
    private static let quoteUrl = URL(string: "https://api.forismatic.com/api/1.0/")!
    
    static func getQuote() {
        var request = URLRequest(url: quoteUrl)
        request.httpMethod = "POST"
        let body = "method=getQuote&lang=en&format=json"
        request.httpBody = body.data(using: .utf8)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            //DispatchQueue.main.async {
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
                
                print(response)
                
                guard let responseJSON = try? JSONDecoder().decode([String: String].self, from: data) else {
                   // gérer l’erreur de décodage
                   return
                }
                guard let text = responseJSON["quoteText"],
                          let author = responseJSON["quoteAuthor"] else {
                   // gérer l’erreur ici
                   return
                }
                print("dicton : \(text)")
                print("auteur : \(author)")
            }
            
        //}
        
        task.resume()
    }
    
    
}
