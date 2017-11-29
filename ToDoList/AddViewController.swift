//
//  AddViewController.swift
//  ToDoList
//
//  Created by Burak Firik on 11/29/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

  
  var previousVC = ToDoTableViewController()
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var importantSwitch: UISwitch!
  
  @IBAction func addTapped(_ sender: Any) {
    
    /*
    if let titleText = titleTextField.text {
      var task = Task()
      task.name = titleTextField.text!
      task.important = importantSwitch.isOn
      previousVC.tasks.append(task)
      previousVC.tableView.reloadData()
      navigationController?.popViewController(animated: true)
    }
 */
    
    if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
      let task = TaskCore(entity: TaskCore.entity(), insertInto: context)
      
      if let titleText = titleTextField.text {
        task.name = titleTextField.text!
        task.important = importantSwitch.isOn
      }
      try? context.save()
      navigationController?.popViewController(animated: true)
      
    }
    
    
    
    
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }

  
    

  
}
