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
    let CHF : Float
}
