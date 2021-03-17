//
//  ViewController.swift
//  weather
//
//  Created by Scott Courtney on 3/16/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITextFieldDelegate {
    let vc = WeatherViewController()
    var weather: WeatherResult?
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var lookupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.delegate = self
        lookupButton.isEnabled = false
        
        // Add style to textfield and button
        Style.styleTextField(cityTextField)
        Style.styleButton(lookupButton)
    }
    
    @IBAction func lookupPressed(_ sender: Any) {
            fetchWeatherData(location: cityTextField.text!)
    }
    
    // Enable/Disable button depending on textfield
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let text = (cityTextField.text! as NSString).replacingCharacters(in: range, with: string)
    if text.isEmpty {
        lookupButton.isEnabled = false
    } else {
        lookupButton.isEnabled = true
    }
     return true
    }
    
    // Call the weather api
    func fetchWeatherData(location: String) {
        let weatherKey = Key.weatherKey
        let weatherUrl = Url.weatherUrl
        let location = location
        Alamofire.request(weatherUrl + location + "&appid=" + weatherKey).responseJSON {(response) in
            guard let data = response.data else { return }
                        do {
                            let decoder = JSONDecoder()
                            let weatherResponse = try decoder.decode(WeatherResult.self, from: data)
                            //switch to WeatherViewController
                            //passing data to VC
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
                            vc.weatherData = weatherResponse
                            self.present(vc, animated: true, completion: nil)
                            
                        } catch let error {
                            print(error)
                        }
        }
    }

}

