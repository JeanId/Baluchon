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
    
    private let weatherUrl = URL(string: weatherUrlString)!
    
    func getCityWeather() {
        
    }
}
