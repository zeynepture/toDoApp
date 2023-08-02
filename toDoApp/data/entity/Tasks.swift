//
//  Tasks.swift
//  toDoApp
//
//  Created by Zeynep on 1.08.2023.
//

import Foundation

class Tasks {

    var task_id:Int?
    var task_name: String?
    
    init() {
        
    }
    
    init(task_id: Int, task_name: String) {
        self.task_id = task_id
        self.task_name = task_name
    }
    
}
