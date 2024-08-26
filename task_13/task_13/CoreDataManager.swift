//
//  CoreDataManager.swift
//  task_13
//
//  Created by Vlad Klunduk on 26/08/2024.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    private init() {}
    
    func createTask(_ name: String) {
        guard let taskEntityDescription = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        let task = Task(entity: taskEntityDescription, insertInto: context)
        task.name = name
        
        appDelegate.saveContext()
    }
    
    func fetchTasks() -> [Task] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Task")
        do {
            return (try? context.fetch(fetchRequest) as? [Task]) ?? []
        }
    }
}
