//
//  ExchangeViewController.swift
//  Baluchon
//
//  Created by Jean Barottin on 08/04/2023.
//

import UIKit

class ExchangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func exchangeRefreshButton() {
        
        ExchangeService.getExchange()
    }
    
    @IBAction func dictonRefreshButton() {
        QuoteService.getQuote()
    }
    
}
