//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Mandeep Sarangal on 2018-03-20.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBAction func addTapped(_ sender: Any) {
        //Create new task
        // When working with core data, creating an entity object is a little different as compared to creating a class object
       let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext
        
        // create an entity for core data
        let task = Task(context: context)
        task.name = taskName.text!
        task.important = importantSwitch.isOn
        
        //save the created entity object in core database
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // pop back
        navigationController?.popViewController(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
