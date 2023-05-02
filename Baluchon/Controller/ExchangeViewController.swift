//
//  ExchangeViewController.swift
//  Baluchon
//
//  Created by Jean Barottin on 08/04/2023.
//

import UIKit

class ExchangeViewController: UIViewController {

    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var currencySelector: UISegmentedControl!
    
    
    
    var amount: Float = 1.0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.isHidden = true
        currencySelector.isEnabled = false
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        currencyLabel.text = currenciesList[SettingService.shared.currencyRow].currencyLabel
        guard let input = Float((amountTextField.text!)) else {
            return
        }
        processExchange(for: input)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    
    
    @IBAction func exchangeRefreshButton() {
        
        let currencies = (UserDefaults.standard.object(forKey: userKey02) as? [Float])!
        for i in currencies {
            print(i)
        }
        
    }
    
    @IBAction func dictonRefreshButton() {
        QuoteService.getQuote()
    }
    
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
           amountTextField.resignFirstResponder()
       }
    
    
    private func processExchange(for amount: Float) {
        amountTextField.isEnabled = false
        activityIndicator.isHidden = false
        ExchangeService.getExchange(amount, callback: {success, result in
            guard let result = result, success == true  else {
                // message erreur
                return
            }
            let formattedResult = String(format: "%.2F", result)
            self.resultLabel.text = "\(formattedResult) \(currenciesList[SettingService.shared.currencyRow].currencyCode)"
        })
        amountTextField.isEnabled = true
        activityIndicator.isHidden = true
    }
 
    
}

extension ExchangeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let input = Float((amountTextField.text!)) else {
            return false
        }
        processExchange(for: input)
        amountTextField.resignFirstResponder()
        return true
    }
}
