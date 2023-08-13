//
//  KayitSayfaViewModel.swift
//  toDoApp
//
//  Created by Zeynep on 11.08.2023.
//

import Foundation

class KayitSayfaViewModel {
    var trepo = TasksDaoRepository()
    func kaydet(task_name: String)
    {
        trepo.kaydet(task_name: task_name)
    }
}
