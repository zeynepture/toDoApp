//
//  DetaySayfaViewModel.swift
//  toDoApp
//
//  Created by Zeynep on 11.08.2023.
//

import Foundation

class DetaySayfaViewModel {
    var trepo = TasksDaoRepository()
    func guncelle(task_id:Int, task_name:String)
    {
        trepo.guncelle(task_id: task_id, task_name: task_name)
    }
}
