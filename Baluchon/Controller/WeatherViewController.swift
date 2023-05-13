//
//  ViewController.swift
//  Baluchon
//
//  Created by Jean Barottin on 08/04/2023.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var city1Label: UILabel!
    @IBOutlet weak var tMax1Label: UILabel!
    @IBOutlet weak var tMin1Label: UILabel!
    @IBOutlet weak var windSpeed1Label: UILabel!
    @IBOutlet weak var windDirection1Label: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weather1Label: UILabel!
    @IBOutlet weak var temp1Label: UILabel!
    @IBOutlet weak var dateTime1Label: UILabel!
    
    @IBOutlet weak var city2Label: UILabel!
    @IBOutlet weak var tMax2Label: UILabel!
    @IBOutlet weak var tMin2Label: UILabel!
    @IBOutlet weak var windSpeed2Label: UILabel!
    @IBOutlet weak var windDirection2Label: UILabel!
    @IBOutlet weak var weather2Icon: UIImageView!
    @IBOutlet weak var weather2Label: UILabel!
    @IBOutlet weak var temp2Label: UILabel!
    @IBOutlet weak var dateTime2Label: UILabel!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActicityIndicator(hidden: true)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getForecasts()
    }

    @IBAction func getMeteo() {
        getForecasts()
    }
    
    // MARK: - get and display forecast Methods
    private func getForecasts() {
        let city1 = SettingService.shared.getCity1Row()
        let city2 = SettingService.shared.getCity2Row()
        
        showActicityIndicator(hidden: false)
        
        WeatherService.shared.getCityWeather(cityAt: city1) { success, forecastdata in
            DispatchQueue.main.async {
                guard let forecastdata = forecastdata, success == true else {
                    self.alertAPIError()
                    return
                }
                self.city1Label.text = forecastdata.name
                self.windDirection1Label.text = self.windDirection(for: Float(forecastdata.wind.deg))
                let wSpeed = String(format: "%.0F", (forecastdata.wind.speed * 3.6))
                self.windSpeed1Label.text = "\(wSpeed) km/h"
                let tMin = String(format: "%.1F", forecastdata.main.temp_min)
                let tMax = String(format: "%.1F", forecastdata.main.temp_max)
                let temp = String(format: "%.1F", forecastdata.main.temp)
                self.tMin1Label.text = "\(tMin)°C"
                self.tMax1Label.text = "\(tMax)°C"
                self.temp1Label.text = "\(temp)°C"
                let dateTime = Date(timeIntervalSince1970: forecastdata.dt)
                let dateF = DateFormatter()
                dateF.dateFormat = "d MMM HH:mm"
                self.dateTime1Label.text = dateF.string(from: dateTime)
                guard let forecastRow = self.getForecastRow(for: forecastdata.weather[0].id) else {
                    // défaut code id météo
                    return
                }
                self.weather1Label.text = forecastsList[forecastRow].description
                self.weatherIcon.image = UIImage(named: forecastsList[forecastRow].icon)
            }
        }
        
        WeatherService.shared.getCityWeather(cityAt: city2) { success, forecastdata in
            DispatchQueue.main.async {
                guard let forecastdata = forecastdata, success == true else {
                    self.alertAPIError()
                    return
                }
                self.city2Label.text = forecastdata.name
                self.windDirection2Label.text = self.windDirection(for: Float(forecastdata.wind.deg))
                let wSpeed = String(format: "%.0F", (forecastdata.wind.speed * 3.6))
                self.windSpeed2Label.text = "\(wSpeed) km/h"
                let tMin = String(format: "%.1F", forecastdata.main.temp_min)
                let tMax = String(format: "%.1F", forecastdata.main.temp_max)
                let temp = String(format: "%.1F", forecastdata.main.temp)
                self.tMin2Label.text = "\(tMin)°C"
                self.tMax2Label.text = "\(tMax)°C"
                self.temp2Label.text = "\(temp)°C"
                let dateTime = Date(timeIntervalSince1970: forecastdata.dt)
                let dateF = DateFormatter()
                dateF.dateFormat = "d MMM HH:mm"
                self.dateTime2Label.text = dateF.string(from: dateTime)
                guard let forecastRow = self.getForecastRow(for: forecastdata.weather[0].id) else {
                    // défaut code id météo
                    return
                }
                self.weather2Label.text = forecastsList[forecastRow].description
                self.weather2Icon.image = UIImage(named: forecastsList[forecastRow].icon)
            }
        }
        
        showActicityIndicator(hidden: true)
    }
    
    // MARK: - hid/show activityIndicator Methods
    private func showActicityIndicator(hidden: Bool) {
        tapButton.isHidden = hidden
        activityIndicator.isHidden = hidden
    }
    
    // MARK: - text wind direction decoder Methods
    private func windDirection(for deg: Float) -> String {
        if deg >= 348.75 {
            return "Nord" }
        if deg > 326.25 {
            return "Nord-NO" }
        if deg > 303.75 {
            return  "Nord-O" }
        if deg > 281.25 {
            return  "Ouest-NO" }
        if deg > 258.75 {
            return  "Ouest" }
        if deg > 236.25 {
            return  "Ouest-SO" }
        if deg > 213.75 {
            return  "Sud-O" }
        if deg > 191.25 {
            return  "Sud-SO" }
        if deg > 168.75 {
            return  "Sud" }
        if deg > 146.25 {
            return  "Sud-SE" }
        if deg > 123.75 {
            return  "Sud-E" }
        if deg > 101.25 {
            return  "Est-SE" }
        if deg > 78.75 {
            return  "Est" }
        if deg > 56.25 {
            return  "Est-NE" }
        if deg > 33.75 {
            return  "Nord-E" }
        if deg > 11.25 {
            return  "Nord-NE" }
        if deg >= 0 {
            return  "Nord" }
        return "Error"
    }
    
    // MARK: - looking for row number for id weather Methods
    private func getForecastRow(for id: Int16) -> Int? {
        for (i, forecast) in forecastsList.enumerated() {
            if forecast.id == id {
                return i
            }
        }
        return nil
    }
    
    // MARK: - alert message Methods
    private func alertAPIError() {
        let alertC = UIAlertController(title: "Pas de réponse", message: "Défaut serveur API de météo", preferredStyle: .alert)
        alertC.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertC, animated: true, completion: nil)
    }
}

