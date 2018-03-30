//
//  TaskCompleteViewController.swift
//  DoIt
//
//  Created by Mandeep Sarangal on 2018-03-21.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class TaskCompleteViewController: UIViewController {
    var task : Task? = nil
    
    @IBOutlet weak var taskName: UILabel!
    
    @IBAction func onTappedCompleteTask(_ sender: Any) {
        // delete task from core data
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer.viewContext
        context.delete(task!)
        
        // save after deleting
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //pop back
        navigationController?.popViewController(animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text = task!.name!
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
