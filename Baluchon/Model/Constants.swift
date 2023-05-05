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


struct Meteo {
    let id: Int16
    let description: String
    let icon: String
}

let forecastsList:[Meteo] = [   Meteo(id: 200, description: "orage et pluie légère", icon: "thunderStorm"),
                                Meteo(id: 201, description: "orage et pluie", icon: "thunderStorm"),
                                Meteo(id: 202, description: "orage et pluie abondante", icon: "thunderStorm"),
                                Meteo(id: 210, description: "orage léger", icon: "thunderStorm"),
                                Meteo(id: 211, description: "orage", icon: "thunderStorm"),
                                Meteo(id: 212, description: "gros orage", icon: "thunderStorm"),
                                Meteo(id: 221, description: "orage déchiqueté", icon: "thunderStorm"),
                                Meteo(id: 230, description: "orage avec légère bruine", icon: "thunderStorm"),
                                Meteo(id: 231, description: "orage avec bruine", icon: "thunderStorm"),
                                Meteo(id: 232, description: "orage avec forte bruine", icon: "thunderStorm"),
                                Meteo(id: 300, description: "bruine lumineuse", icon: "rain"),
                                Meteo(id: 301, description: "bruine", icon: "rain"),
                                Meteo(id: 302, description: "forte bruine", icon: "rain"),
                                Meteo(id: 310, description: "bruine et pluie lumineuse", icon: "rain"),
                                Meteo(id: 311, description: "bruine pluie", icon: "rain"),
                                Meteo(id: 312, description: "pluie de bruine forte", icon: "rain"),
                                Meteo(id: 313, description: "averse pluie et bruine", icon: "rain"),
                                Meteo(id: 314, description: "forte averse pluie et bruine", icon: "rain"),
                                Meteo(id: 321, description: "averse de bruine", icon: "rain"),
                                Meteo(id: 500, description: "pluie légère", icon: "rain"),
                                Meteo(id: 501, description: "pluie modérée", icon: "rain"),
                                Meteo(id: 502, description: "pluie forte", icon: "showerrain"),
                                Meteo(id: 503, description: "pluie très forte", icon: "showerrain"),
                                Meteo(id: 504, description: "pluie extrême", icon: "showerrain"),
                                Meteo(id: 511, description: "pluie verglaçante", icon: "showerrain"),
                                Meteo(id: 520, description: "averse de pluie lumineuse", icon: "showerrain"),
                                Meteo(id: 521, description: "averse de pluie", icon: "showerrain"),
                                Meteo(id: 522, description: "forte averse de pluie", icon: "showerrain"),
                                Meteo(id: 531, description: "pluie irrégulière", icon: "showerrain"),
                                Meteo(id: 600, description: "neige légère", icon: "snow"),
                                Meteo(id: 601, description: "neige", icon: "snow"),
                                Meteo(id: 602, description: "beaucoup de neige", icon: "snow"),
                                Meteo(id: 611, description: "neige fondue", icon: "snow"),
                                Meteo(id: 612, description: "léger grésil ", icon: "snow"),
                                Meteo(id: 613, description: "grésil régulier", icon: "snow"),
                                Meteo(id: 615, description: "pluie légère et neige", icon: "snow"),
                                Meteo(id: 616, description: "pluie et neige", icon: "snow"),
                                Meteo(id: 620, description: "légère averse de neige", icon: "snow"),
                                Meteo(id: 621, description: "averse de neige", icon: "snow"),
                                Meteo(id: 622, description: "forte averse de neige", icon: "snow"),
                                Meteo(id: 701, description: "brume", icon: "mist"),
                                Meteo(id: 711, description: "fumée", icon: "mist"),
                                Meteo(id: 721, description: "brume", icon: "mist"),
                                Meteo(id: 731, description: "tourbillons de sable", icon: "mist"),
                                Meteo(id: 741, description: "brouillard", icon: "mist"),
                                Meteo(id: 751, description: "sable", icon: "mist"),
                                Meteo(id: 761, description: "poussière", icon: "mist"),
                                Meteo(id: 762, description: "cendre volcanique", icon: "mist"),
                                Meteo(id: 771, description: "grains", icon: "mist"),
                                Meteo(id: 781, description: "tornade", icon: "tornado"),
                                Meteo(id: 800, description: "ciel clair", icon: "sun"),
                                Meteo(id: 801, description: "quelques nuages", icon: "fewClouds"),
                                Meteo(id: 802, description: "nuages dispersés", icon: "scatteredClouds"),
                                Meteo(id: 803, description: "nuages fragmentés", icon: "scatteredClouds"),
                                Meteo(id: 804, description: "nuages couverts", icon: "clouds")
                            ]
