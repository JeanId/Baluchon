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
    
    @IBAction func tapTranslate() {
        textToTranslate.isEnabled.toggle()
       // translate()
    }
    
    
    private func translate(_ stringToTranslate: String) {
        showActicityIndicator(hidden: false)
        TranslateService.shared.getTranslate(stringToTranslate, callback: { success, translationText in
            DispatchQueue.main.async {
                guard let translationText = translationText, success == true else {
                    // message erreur
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
    
}

extension TranslateViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let input = textToTranslate.text else {
            // defaut string
            return false
        }
        translate(input)
        textToTranslate.resignFirstResponder()
        return true
    }
    
}
