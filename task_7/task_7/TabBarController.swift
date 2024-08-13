//
//  TabBarController.swift
//  task_7
//
//  Created by Vlad Klunduk on 13/08/2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    let first = ViewController()
    let second = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        first.tabBarItem = UITabBarItem(title: "first", image: nil, tag: 0)
        second.tabBarItem = UITabBarItem(title: "second", image: nil, tag: 0)
        viewControllers = [first, second]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
