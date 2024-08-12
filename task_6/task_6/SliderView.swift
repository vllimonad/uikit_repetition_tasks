//
//  SliderView.swift
//  task_6
//
//  Created by Vlad Klunduk on 12/08/2024.
//

import UIKit

class SliderView: UIView {

    var slider: UISlider = {
        var slider = UISlider()
        slider.value = 1
        slider.minimumValue = 1
        slider.maximumValue = 255
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    var label: UILabel = {
       var label = UILabel()
        label.text = "7"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var delegate: SliderViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 32
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(slider)
        self.addSubview(stack)
        
        NSLayoutConstraint.activate([            
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
    
    @objc func sliderChanged() {
        delegate.update()
        label.text = String(Int(slider.value))
    }
}


protocol SliderViewDelegate {
    func update()
}
