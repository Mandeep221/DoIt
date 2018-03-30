//
//  TasksViewController.swift
//  DoIt
//
//  Created by Mandeep Sarangal on 2018-03-19.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.

//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var tasks: [Task] = []
    
    // Same as onCreate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // Same as onResume
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if(task.important){
            cell.textLabel?.text = "❗️\(task.name!)"
        }else{
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer.viewContext
        do{
          tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        }catch{
            print("We have core data error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       if(segue.identifier == "selectTaskSegue"){
            let nextVc = segue.destination as! TaskCompleteViewController
            nextVc.task = sender as! Task
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
}

