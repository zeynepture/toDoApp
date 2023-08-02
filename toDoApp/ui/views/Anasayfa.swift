//
//  ViewController.swift
//  toDoApp
//
//  Created by Zeynep on 1.08.2023.
//

import UIKit

class Anasayfa: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func btnDetay(_ sender: Any) {
        let task = Tasks(task_id: 3, task_name: "Odev yapilacak")
        performSegue(withIdentifier: "toDetay", sender: task)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let task = sender as? Tasks {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.task = task
            }
            
        }
    }
}
