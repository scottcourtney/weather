//
//  DetailViewController.swift
//  weather
//
//  Created by Scott Courtney on 3/16/21.
//

import UIKit

class DetailViewController: UIViewController {
    var tempLabelString: String?
    var feelsLikeLabelString: String?
    var skyLabelString: String?
    var descSkyLabelString: String?
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var skyLabel: UILabel!
    @IBOutlet weak var descSkyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load all the labels with data from Weather VC
        tempLabel.text = tempLabelString
        feelsLikeLabel.text = feelsLikeLabelString
        skyLabel.text = skyLabelString
        descSkyLabel.text = descSkyLabelString
    }
}
