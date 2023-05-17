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
        amountTextField.text = "1"
        processExchange(for: 1)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        currencyLabel.text = currenciesList[SettingService.shared.getCurrencyRow()].currencyLabel
        guard let input = Float((amountTextField.text!)) else {
            return
        }
        processExchange(for: input)
    }
    
   
    
    // MARK: - tap on screen to return Method
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
            guard let input = Float((amountTextField.text!)) else {
                return
            }
            processExchange(for: input)
            amountTextField.resignFirstResponder()
       }
    
    // MARK: - get and display the change Method
    private func processExchange(for amount: Float) {
        amountTextField.isEnabled = false
        activityIndicator.isHidden = false
        ExchangeService.shared.getExchange(amount, callback: {refresh, success, result in
            DispatchQueue.main.async {
                guard let result = result, success == true  else {
                    self.alertAPIError()
                    return
                }
                let formattedResult = String(format: "%.2F", result)
                self.resultLabel.text = "\(formattedResult) \(currenciesList[SettingService.shared.getCurrencyRow()].currencyCode)"
                if refresh {
                    self.resultLabel.text = self.resultLabel.text! + "  💭"
                }
            }
        })
        amountTextField.isEnabled = true
        activityIndicator.isHidden = true
    }
 
    
}

// MARK: - TextField Management and Alert Methods
extension ExchangeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let input = Float((amountTextField.text!)) else {
            return false
        }
        processExchange(for: input)
        amountTextField.resignFirstResponder()
        return true
    }
    
    private func alertAPIError() {
        let alertC = UIAlertController(title: "Pas de réponse", message: "Défaut serveur API du cour des devises", preferredStyle: .alert)
        alertC.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertC, animated: true, completion: nil)
    }
}
