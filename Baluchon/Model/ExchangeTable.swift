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

struct Rates: Codable {
    let ARS : Float
    let BOB : Float
    let BRL : Float
    let BTC : Float
    let CAD : Float
    let CHF : Float
    let CLP : Float
    let COP : Float
    let CRC : Float
    let CUC : Float
    let CUP : Float
    let DOP : Float
    let GBP : Float
    let GTQ : Float
    let MXN : Float
    let PEN : Float
    let RUB : Float
    let USD : Float
}

