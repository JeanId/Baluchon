//
//  Data.swift
//  Baluchon
//
//  Created by Jean Barottin on 25/04/2023.
//

import Foundation


let userKey01 = "currencyKey"
let userKey02 = "exchangeKey"
let userKey03 = "timeStampKey"


let exchangeUrlString = "https://api.apilayer.com/fixer/latest"
let exchangeToken = "RbNNL4KRGmwJlD8sGuGgIDORlsJq4HuU"
let translateUrlString = "https://translation.googleapis.com/language/translate/v2"
let translateToken = "AIzaSyBAoGJfoIuLl1NCR0KSngZdBY7xMn4EM4o"
let weatherUrlString = "https://api.openweathermap.org/data/2.5/weather"
let weatherToken = "aca98bb6fa53dd41939ee184462d2d8e"

struct Currency {
    let currencyCode: String
    let currencyLabel: String
}

let currenciesList: [Currency] = [Currency(currencyCode: "ARS", currencyLabel: "Argentine Peso"),
                                  Currency(currencyCode: "BOB", currencyLabel: "Bolivian Boliviano"),
                                  Currency(currencyCode: "BRL", currencyLabel: "Brazilian Real"),
                                  Currency(currencyCode: "BTC", currencyLabel: "Bitcoin"),
                                  Currency(currencyCode: "CAD", currencyLabel: "Canadian Dollar"),
                                  Currency(currencyCode: "CHF", currencyLabel: "Swiss Franc"),
                                  Currency(currencyCode: "CLP", currencyLabel: "Chilean Peso"),
                                  Currency(currencyCode: "COP", currencyLabel: "Colombian Peso"),
                                  Currency(currencyCode: "CRC", currencyLabel: "Costa Rican Colón"),
                                  Currency(currencyCode: "CUC", currencyLabel: "Cuban Convertible Peso"),
                                  Currency(currencyCode: "CUP", currencyLabel: "Cuban Peso"),
                                  Currency(currencyCode: "DOP", currencyLabel: "Dominican Peso"),
                                  Currency(currencyCode: "GBP", currencyLabel: "British Pound Sterling"),
                                  Currency(currencyCode: "GTQ", currencyLabel: "Guatemalan Quetzal"),
                                  Currency(currencyCode: "MXN", currencyLabel: "Mexican Peso"),
                                  Currency(currencyCode: "PEN", currencyLabel: "Peruvian Nuevo Sol"),
                                  Currency(currencyCode: "RUB", currencyLabel: "Russian Ruble"),
                                  Currency(currencyCode: "USD", currencyLabel: "United States Dollar")
                                  
]

struct Location {
    let cityName: String
    let lat: Double
    let lon: Double
}

let locationsList: [Location] = [Location(cityName: "Tavaux", lat: 47.0439, lon: 5.4125),
                                 Location(cityName: "Saugnac et Cambran", lat: 44.4021, lon: -7.7831),
                                 Location(cityName: "Dax", lat: 43.7103, lon: -1.0537),
                                 Location(cityName: "New York City", lat: 40.714300, lon: -74.006000),
                                 Location(cityName: "San Francisco", lat: 37.774900, lon: -122.419400),
                                 Location(cityName: "Nancy", lat: 48.693576 , lon: 6.183311),
                                 Location(cityName: "Bordeaux", lat: 44.8404, lon: -0.5805),
                                 Location(cityName: "Habas", lat: 43.5718, lon: -0.9298),
                                 Location(cityName: "Bayonne", lat: 43.4833, lon: -1.4833),
                                 Location(cityName: "Paris", lat: 48.8534, lon: 2.3488),
                                 Location(cityName: "Tignes", lat: 45.496, lon: 6.9246)
]


