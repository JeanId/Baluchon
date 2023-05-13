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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true

    }
    

    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        textToTranslate.resignFirstResponder()
    }
    
    
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
    
    private func showActicityIndicator(hidden: Bool) {
        textToTranslate.isEnabled = hidden
        activityIndicator.isHidden = hidden
    }
    
    private func alertAPIError() {
        let alertC = UIAlertController(title: "Pas de réponse", message: "Défaut serveur API de traduction de texte", preferredStyle: .alert)
        alertC.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertC, animated: true, completion: nil)
    }
    
}

extension TranslateViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let input = textToTranslate.text else {
            self.alertTextFieldError(message: "défaut chaine de caractère incorrecte")
            return false
        }
        if input.count < 40 {
            translate(input)
            textToTranslate.resignFirstResponder()
            return true
        } else {
            self.alertTextFieldError(message: "message à traduire trop long ! > à 40 caractères")
            return false
        }
    }
    
    private func alertTextFieldError(message: String) {
        let alertC = UIAlertController(title: "Entrée incorrecte", message: message, preferredStyle: .alert)
        alertC.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertC, animated: true, completion: nil)
    }
}
