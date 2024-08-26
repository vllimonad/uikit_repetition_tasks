//
//  ViewController.swift
//  task_13
//
//  Created by Vlad Klunduk on 26/08/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var tableview = UITableView()
    var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tasks = CoreDataManager.shared.fetchTasks()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view = tableview
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    @objc func addButtonTapped() {
        CoreDataManager.shared.createTask("woicm")
        tasks = CoreDataManager.shared.fetchTasks()
        
        let indexPath = IndexPath(row: tasks.count - 1, section: 0)
        tableview.insertRows(at: [indexPath], with: .automatic)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].name
        return cell
    }
}


