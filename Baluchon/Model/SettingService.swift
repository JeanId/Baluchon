//
//  SettingService.swift
//  Baluchon
//
//  Created by Jean Barottin on 25/04/2023.
//

import Foundation

class SettingService {
    static var shared = SettingService()
    private init() { }
    
    func saveCurrency(at row: Int) {
        UserDefaults.standard.set(row, forKey: userKey01)
    }
    
    func getCurrencyRow() -> Int {
        return UserDefaults.standard.integer(forKey: userKey01)
    }
    
    func saveCity1(at row: Int) {
        UserDefaults.standard.set(row, forKey: userKey04)
    }
    
    func getCity1Row() -> Int {
        return UserDefaults.standard.integer(forKey: userKey04)
    }
    
    func saveCity2(at row: Int) {
        UserDefaults.standard.set(row, forKey: userKey05)
    }
    
    func getCity2Row() -> Int {
        return UserDefaults.standard.integer(forKey: userKey05)
    }
}
