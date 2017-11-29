//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Burak Firik on 11/29/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
  var tasks: [TaskCore] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  func getToDos() {
    if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
      if let coreDataTask = try? context.fetch(TaskCore.fetchRequest()) as? [TaskCore] {
        if let core = coreDataTask {
          tasks = core
          tableView.reloadData()
        }
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }
  
  override func viewWillAppear(_ animated: Bool) {
    getToDos()
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    let task = tasks[indexPath.row]
    
    if let name = task.name {
      if (task.important) {
        cell.textLabel?.text = "❗️" + name
      } else {
        cell.textLabel?.text = name
      }
      
      
    }
    
    return cell
  }
  
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let task = tasks[indexPath.row]
    performSegue(withIdentifier: "completeSegue", sender: task)
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let addVC = segue.destination as? AddViewController {
      addVC.previousVC = self
    }
    if let completeVC = segue.destination as? CompleteViewController {
      if let toDo = sender as? TaskCore {
        completeVC.selectedTask = toDo
        completeVC.previousVC = self
      }
      
      
    }
  }
  
  
  func createTasks() -> [Task] {
    let task1 = Task()
    task1.name = "Buy Eggs"
    task1.important = true
    
    let task2 = Task()
    task2.name = "Walk the dog"
    
    let chese = Task()
    chese.name = "Eat Cheese"
    
    return [task1, task2,chese]
  }
  
  
}
