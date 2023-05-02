//
//  TranslateService.swift
//  Baluchon
//
//  Created by Jean Barottin on 01/05/2023.
//

import Foundation

class TranslateService {
    static var shared = TranslateService()
    private let translateUrl = URL(string: translateUrlString)!
    
    
    private init() {}
    
    func getTranslate(_ stringToTranslate: String, callback: @escaping (Bool, String?) ->Void) {
        var request = URLRequest(url: translateUrl)
        request.httpMethod = "POST"
        let body = "q=" + stringToTranslate + "&target=fr&format=text&source=en&key=" + translateToken
        request.httpBody = body.data(using: .utf8)
        let session = URLSession(configuration: .default)
        //task?.cancel()
        let task = session.dataTask(with: request) { data, response, error in
           // DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    callback(false, nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print("erreur response")
                    callback(false, nil)
                    return
                }
                
                do {
                    let translated = try JSONDecoder().decode(TranslateData.self, from: data)
                    callback(true, translated.data.translations[0].translatedText)
                    
                } catch let error {
                    callback(false, nil)
                    print(error)
                    
                }
            //}
            
            
        }
        task.resume()
    }
}
