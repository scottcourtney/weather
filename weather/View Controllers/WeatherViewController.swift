//
//  WeatherViewController.swift
//  weather
//
//  Created by Scott Courtney on 3/16/21.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var skyLabel: UILabel!
    
}

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    let measurementFormatter = MeasurementFormatter()
    let numberFormatter = NumberFormatter()


    var weatherData: WeatherResult?
    @IBOutlet weak var weatherTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCells", for: indexPath) as! WeatherTableViewCell
        let date = weatherData?.list[indexPath.row].dt_txt
        let temp = Measurement(value: (weatherData?.list[indexPath.row].main.temp)!, unit: UnitTemperature.kelvin)
        let sky = weatherData?.list[indexPath.row].weather[0].main
        cell.dateLabel.text = date
        cell.tempLabel.text = measurementFormatter.string(from: temp.converted(to: .fahrenheit))
        cell.skyLabel.text = sky

        return cell
    }

    // Switch to Detail View Controller based on row selected
    // Passing data to Detail VC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        // Convert Kelvin to Fahrenheit
        let temp = Measurement(value: (weatherData?.list[indexPath.row].main.temp)!, unit: UnitTemperature.kelvin)
        let feelsLike = Measurement(value: (weatherData?.list[indexPath.row].main.feels_like)!, unit: UnitTemperature.kelvin)
        
        // FUTURE REMOVE DECIMALS
        
        vc.skyLabelString = weatherData?.list[indexPath.row].weather[0].main
        vc.descSkyLabelString = weatherData?.list[indexPath.row].weather[0].description
        vc.tempLabelString =  measurementFormatter.string(from: temp.converted(to: .fahrenheit))
        vc.feelsLikeLabelString = measurementFormatter.string(from: feelsLike.converted(to: .fahrenheit))
        
        self.present(vc, animated: true, completion: nil)
    }
}
