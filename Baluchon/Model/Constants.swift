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


