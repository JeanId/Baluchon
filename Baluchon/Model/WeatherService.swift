//
//  WeatherService.swift
//  Baluchon
//
//  Created by Jean Barottin on 02/05/2023.
//

import Foundation

class WeatherService {
    static var shared = WeatherService()
    private init() {}
    
    private var session = URLSession(configuration: .default)
    init(session: URLSession) {
        self.session = session
    }
    
    
    func getCityWeather(cityAt row: Int, callback: @escaping (Bool, ForecastData?) -> Void) {
        // API call preparation
        let lat = String(locationsList[row].lat)
        let lon = String(locationsList[row].lon)
        let params = "?lat=" + lat + "&lon=" + lon + "&appid=" + weatherToken + "&units=metric"
        let weatherUrl = URL(string: weatherUrlString + params)!
        var request = URLRequest(url: weatherUrl)
        request.httpMethod = "POST"
        
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                callback(false, nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(false, nil)
                return
            }
            
            do {
                let cityForecast = try JSONDecoder().decode(ForecastData.self, from: data)
                callback(true, cityForecast)
                
            } catch let error {
                print(error)
                callback(false, nil)
            }
        }
        task.resume()
    }
    
}
