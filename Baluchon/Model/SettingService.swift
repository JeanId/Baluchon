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
    
    // MARK: - Currency Management Methods
    func saveCurrency(at row: Int) {
        UserDefaults.standard.set(row, forKey: userKey01)
    }
    
    func getCurrencyRow() -> Int {
        return UserDefaults.standard.integer(forKey: userKey01)
    }
    
    
    // MARK: - City1 Management Methods
    func saveCity1(at row: Int) {
        UserDefaults.standard.set(row, forKey: userKey04)
    }
    
    func getCity1Row() -> Int {
        return UserDefaults.standard.integer(forKey: userKey04)
    }
    
    
    // MARK: - City2 Management Methods
    func saveCity2(at row: Int) {
        UserDefaults.standard.set(row, forKey: userKey05)
    }
    
    func getCity2Row() -> Int {
        return UserDefaults.standard.integer(forKey: userKey05)
    }
}
