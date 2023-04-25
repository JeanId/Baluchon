//
//  Rates.swift
//  Baluchon
//
//  Created by Jean Barottin on 23/04/2023.
//  Struct to decode JSON File

import Foundation

struct Rates: Codable {
    let EUR : Float
    let USD : Float
    let MXN : Float
    let CAD : Float
    let ARS : Float
    let PEN : Float
    let CHF : Float
    let CRC : Float
    let COP : Float
    let GBP : Float
    let RUB : Float
}
