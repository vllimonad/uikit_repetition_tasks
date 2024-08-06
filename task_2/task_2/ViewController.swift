//
//  ViewController.swift
//  task_2
//
//  Created by Vlad Klunduk on 06/08/2024.
//

import UIKit

class ViewController: UIViewController {
     
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorScreen: UILabel!
    
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = 1
        redSlider.minimumValue = 1
        redSlider.maximumValue = 255
        redLabel.text = "1"
        
        blueSlider.value = 1
        blueSlider.minimumValue = 1
        blueSlider.maximumValue = 255
        blueLabel.text = "1"
        
        greenSlider.value = 1
        greenSlider.minimumValue = 1
        greenSlider.maximumValue = 255
        greenLabel.text = "1"

    }

    @IBAction func redSliderAction(_ sender: Any) {
        redLabel.text = String(Int(redSlider.value))
        colorScreen.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
    @IBAction func greenSliderAction(_ sender: Any) {
        greenLabel.text = String(Int(greenSlider.value))
        colorScreen.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {
        blueLabel.text = String(Int(blueSlider.value))
        colorScreen.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
}
