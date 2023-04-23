//
//  ExchangeTable.swift
//  Baluchon
//
//  Created by Jean Barottin on 23/04/2023.
//  Struct to decode JSON File 

import Foundation

struct ExchangeTable: Codable {
    let success : Bool
    let timestamp : Double
    let base : String
    let date : String
    let rates: Rates
}
