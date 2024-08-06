//
//  ViewController.swift
//  task_1
//
//  Created by Vlad Klunduk on 05/08/2024.
//

import UIKit

enum Light {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet weak var redLight: UILabel!
    @IBOutlet weak var yellowLight: UILabel!
    @IBOutlet weak var greenLight: UILabel!
    
    private var currentLight = Light.red
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redLight.backgroundColor = .red
        yellowLight.backgroundColor = .yellow
        greenLight.backgroundColor = .green
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTapped(_ sender: Any) {
        if currentLight == .red {
            currentLight = .yellow
            redLight.alpha = 0.3
            yellowLight.alpha = 1.0
        } else if currentLight == .yellow {
            currentLight = .green
            yellowLight.alpha = 0.3
            greenLight.alpha = 1.0
        } else if currentLight == .green {
            currentLight = .red
            greenLight.alpha = 0.3
            redLight.alpha = 1.0
        }
    }
}

