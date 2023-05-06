//
//  ForecastData.swift
//  Baluchon
//
//  Created by Jean Barottin on 03/05/2023.
//

import Foundation

struct ForecastData: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int16
    let wind: Wind
    let dt: Double
    let timezone: Int32
    let name: String
}

struct Coord: Codable {
    let lat: Double
    let lon: Double
}


struct Weather: Codable {
    let id: Int16
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Int16
    let humidity: Int8
}

struct Wind: Codable {
    let speed: Float
    let deg: Int16
}

