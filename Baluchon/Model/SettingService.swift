//
//  SettingService.swift
//  Baluchon
//
//  Created by Jean Barottin on 25/04/2023.
//

import Foundation

class SettingService {
    static var shared = SettingService()
    var currencyRow:Int
    
    private init() {
        self.currencyRow = UserDefaults.standard.integer(forKey: userKey01)
    }
    
    func saveCurrency(at row: Int) {
        self.currencyRow = row
        UserDefaults.standard.set(row, forKey: userKey01)
    }
    
    func getCurrencyRow() -> Int {
        return UserDefaults.standard.integer(forKey: userKey01)
    }
}
