//
//  createTaskViewController.swift
//  DoIt
//
//  Created by Bill Boughton on 6/5/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit

class createTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
//    var previousVC = TasksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTapped(_ sender: Any) {
        //create a Task from the outlet information
        //add new task to array in previous viewCOntroller
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let task = Task(context: context)
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
//        previousVC.tasks.append(task)
//        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }



}
