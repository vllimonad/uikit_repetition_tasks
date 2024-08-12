//
//  ViewController.swift
//  task_6
//
//  Created by Vlad Klunduk on 12/08/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var redSlider = SliderView()
    var greenSlider = SliderView()
    var blueSlider = SliderView()
    
    var colorLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = .gray
        label.layer.cornerRadius = 18
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var stack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        redSlider.delegate = self
        greenSlider.delegate = self
        blueSlider.delegate = self
        addViews()
    }
    
    func addViews() {
        stack.addArrangedSubview(redSlider)
        stack.addArrangedSubview(greenSlider)
        stack.addArrangedSubview(blueSlider)
        
        view.addSubview(colorLabel)
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            colorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            colorLabel.heightAnchor.constraint(equalToConstant: 150),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            colorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            stack.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 32),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stack.heightAnchor.constraint(greaterThanOrEqualToConstant: 150)
        ])
    }
}

extension ViewController: SliderViewDelegate {
    func update() {
        colorLabel.backgroundColor = UIColor(
            red: CGFloat(redSlider.slider.value/255),
            green: CGFloat(greenSlider.slider.value/255),
            blue: CGFloat(blueSlider.slider.value/255),
            alpha: 1)
    }
}

