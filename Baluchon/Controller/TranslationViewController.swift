//
//  TranslateViewController.swift
//  Baluchon
//
//  Created by Jean Barottin on 08/04/2023.
//

import UIKit


class TranslateViewController: UIViewController {
    @IBOutlet weak var textToTranslate: UITextField!
    @IBOutlet weak var translatedText: UILabel!
    @IBOutlet weak var nbCaractLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true

    }
    
    // MARK: - tap on screen to return Method
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        if textToTranslate.text == "" {
            translatedText.text = "  ......."
        } else {
            guard let input = textToTranslate.text else {
                self.alertTextFieldError(message: "défaut chaine de caractères incorrecte")
                return
            }
            if input.count < 50 {
                translate(input)
            }
        }
        textToTranslate.resignFirstResponder()
    }
    
    // MARK: - get and display the translate Method
    private func translate(_ stringToTranslate: String) {
        showActicityIndicator(hidden: false)
        TranslateService.shared.getTranslate(stringToTranslate, callback: { success, translationText in
            DispatchQueue.main.async {
                guard let translationText = translationText, success == true else {
                    self.alertAPIError()
                    return
                }
                self.translatedText.text = translationText
            }
        })
        showActicityIndicator(hidden: true)
    }
    
    // MARK: - hid/show activityIndicator Method
    private func showActicityIndicator(hidden: Bool) {
        textToTranslate.isEnabled = hidden
        activityIndicator.isHidden = hidden
    }
    
    // MARK: - alert API message Method
    private func alertAPIError() {
        let alertC = UIAlertController(title: "Pas de réponse", message: "Défaut serveur API de traduction de texte", preferredStyle: .alert)
        alertC.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertC, animated: true, completion: nil)
    }
    
}


// MARK: - TextField editing Management and Alert Methods
extension TranslateViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let input = textToTranslate.text else {
            self.alertTextFieldError(message: "défaut chaine de caractères incorrecte")
            return false
        }
        if input.count < 50 {
            translate(input)
            textToTranslate.resignFirstResponder()
            return true
        } else {
            self.alertTextFieldError(message: "message trop long, supérieur à 50 caractères")
            return false
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let input = textField.text else {
            self.alertTextFieldError(message: "défaut chaine de caractères incorrecte")
            return false
        }
        if string == "" {
            return true
        } else {
            let nbCar = input.count+1
            nbCaractLabel.text = String(nbCar)
            if nbCar > 50 {
                nbCaractLabel.textColor = UIColor.red
            } else {
                nbCaractLabel.textColor = UIColor.systemGray
            }
        }
        return true
    }
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let input = textField.text else {
            self.alertTextFieldError(message: "défaut chaine de caractères incorrecte")
            return
        }
            let nbCar = input.count+1
            nbCaractLabel.text = String(nbCar)
            if nbCar > 50 {
                nbCaractLabel.textColor = UIColor.red
            } else {
                nbCaractLabel.textColor = UIColor.systemGray
            }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textToTranslate.text = ""
        translatedText.text = "  ......."
        nbCaractLabel.textColor = UIColor.systemGray
        nbCaractLabel.text = "0"
        return true
    }
    
    // MARK: - alert TextField message Method
    private func alertTextFieldError(message: String) {
        let alertC = UIAlertController(title: "Entrée incorrecte", message: message, preferredStyle: .alert)
        alertC.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertC, animated: true, completion: nil)
    }
}
