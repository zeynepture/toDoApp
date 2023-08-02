//
//  DetaySayfa.swift
//  toDoApp
//
//  Created by Zeynep on 1.08.2023.
//

import UIKit

class DetaySayfa: UIViewController {

    
    @IBOutlet weak var taskName: UITextField!
    var task:Tasks?
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        if let k = task {
            taskName.text = k.task_name
        }
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let tn = taskName.text , let k = task {
            guncelle(task_id: k.task_id!, task_name: tn)
        }
    }
    
    
    func guncelle(task_id:Int, task_name:String)
    {
        print("Task guncelle : \(task_id) - \(task_name) ")
    }
    
   
    
}
