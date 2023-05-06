//
//  SettingsViewController.swift
//  Baluchon
//
//  Created by Jean Barottin on 25/04/2023.
//

import UIKit


class SettingsViewController: UIViewController  {
    
    @IBOutlet weak var currencyTextField: UITextField!
    
    
     var currencyPickerView = UIPickerView()
    
    var currencyRow = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        currencyTextField.inputView = currencyPickerView
        currencyTextField.placeholder = "Selectionnez une device"
        
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currencyRow = SettingService.shared.getCurrencyRow()
        currencyTextField.text = "Devise choisie : \(currenciesList[currencyRow].currencyCode)"
        currencyPickerView.selectRow(currencyRow, inComponent: 0, animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SettingService.shared.saveCurrency(at: currencyRow)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
      
    
   

    
    
}


 
 extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
 
 
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }
 
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return currenciesList.count
     }
 
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return currenciesList[row].currencyLabel
     }
 
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         currencyRow = row
         currencyTextField.text = "Devise choisie : \(currenciesList[row].currencyCode)"
         currencyTextField.resignFirstResponder()
     }
 
 }
 
 

