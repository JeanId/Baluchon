//
//  TranslateData.swift
//  Baluchon
//
//  Created by Jean Barottin on 01/05/2023.
//

import Foundation

struct TranslateData: Codable {
    let data: Translations
}

struct Translations: Codable {
    let translations: [TranslatedText]
}

struct TranslatedText: Codable {
    let translatedText: String
}
