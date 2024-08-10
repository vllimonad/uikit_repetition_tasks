//
//  TabBarController.swift
//  task_4
//
//  Created by Vlad Klunduk on 09/08/2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        var first = FirstViewController()
        first.tabBarItem.image = UIImage(systemName: "person")
        
        var second = SecondViewController()
        second.tabBarItem.image = UIImage(systemName: "trash")
        
        setViewControllers([first, second], animated: true)
        
        navigationItem.hidesBackButton = true
    }
    

    

}
