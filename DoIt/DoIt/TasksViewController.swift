//
//  TasksViewController.swift
//  DoIt
//
//  Created by Bill Boughton on 6/5/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
//    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
            
        } else {
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "seletTaskSegue", sender: task)
    }
    
    
    
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("this is an error from the DO-CATCH on fetching data")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "addSegue" {
//            let nextVC = segue.destination as! createTaskViewController
////            nextVC.previousVC = self
//        }
        if segue.identifier == "seletTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
//            nextVC.previousVC = self
        }
    }
    
}

