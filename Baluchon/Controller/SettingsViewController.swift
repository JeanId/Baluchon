//
//  SettingsViewController.swift
//  Baluchon
//
//  Created by Jean Barottin on 25/04/2023.
//

import UIKit


class SettingsViewController: UIViewController  {
    
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var city1TextField: UITextField!
    @IBOutlet weak var city2TextField: UITextField!
    
    
    var currencyPickerView = UIPickerView()
    var city1PickerView = UIPickerView()
    var city2PickerView = UIPickerView()
    
    var currencyRow = 3
    var city1Row = 0
    var city2Row = 1
    
    // MARK: - pickerViews init Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyTextField.inputView = currencyPickerView
        currencyTextField.placeholder = "Selectionnez une devise"
        city1TextField.inputView = city1PickerView
        city1TextField.placeholder = "Selectionnez une ville"
        city2TextField.inputView = city2PickerView
        city2TextField.placeholder = "Selectionnez une ville"
        
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
        city1PickerView.delegate = self
        city1PickerView.dataSource = self
        city2PickerView.delegate = self
        city2PickerView.dataSource = self
        
        currencyPickerView.tag = 1
        city1PickerView.tag = 2
        city2PickerView.tag = 3
        
    }
    
    // MARK: - display TexFields Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currencyRow = SettingService.shared.getCurrencyRow()
        currencyTextField.text = "Devise : \(currenciesList[currencyRow].currencyCode)"
        currencyPickerView.selectRow(currencyRow, inComponent: 0, animated: true)
        city1Row = SettingService.shared.getCity1Row()
        city1TextField.text = "Météo ville 1 : \(locationsList[city1Row].cityName)"
        city1PickerView.selectRow(city1Row, inComponent: 0, animated: true)
        city2Row = SettingService.shared.getCity2Row()
        city2TextField.text = "Météo ville 2 : \(locationsList[city2Row].cityName)"
        city2PickerView.selectRow(city2Row, inComponent: 0, animated: true)
    }

   
    
    // MARK: - save PickerWiews Methods
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SettingService.shared.saveCurrency(at: currencyRow)
        SettingService.shared.saveCity1(at: city1Row)
        SettingService.shared.saveCity2(at: city2Row)
    }


    
}


// MARK: - PickerViews Management  Methods
 extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
 
     
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }
 
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         switch pickerView.tag {
             case 1:
                return currenciesList.count
             case 2:
                return locationsList.count
             case 3:
                return locationsList.count
             default:
                 return 1
         }
         
     }
 
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         switch pickerView.tag {
             case 1:
                return currenciesList[row].currencyLabel
             case 2:
                return locationsList[row].cityName
             case 3:
                return locationsList[row].cityName
             default:
                 return nil
         }
     }
 
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         switch pickerView.tag {
             case 1:
                currencyRow = row
                currencyTextField.text = "Devise : \(currenciesList[row].currencyCode)"
                currencyTextField.resignFirstResponder()
             case 2:
                city1Row = row
                city1TextField.text = "Météo ville 1 : \(locationsList[row].cityName)"
                city1TextField.resignFirstResponder()
             case 3:
                city2Row = row
                city2TextField.text = "Météo ville 2 : \(locationsList[row].cityName)"
                city2TextField.resignFirstResponder()
             default:
                 return
         }
         
     }
 
 }
 
 

