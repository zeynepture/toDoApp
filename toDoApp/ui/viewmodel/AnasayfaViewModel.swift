//
//  AnasayfaViewModel.swift
//  toDoApp
//
//  Created by Zeynep on 11.08.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var trepo = TasksDaoRepository()
    var taskListesi = BehaviorSubject<[Tasks]>(value: [Tasks]())
    
    init() {
        taskListesi = trepo.taskListesi
    }
    func sil(task_id: Int) {
        trepo.sil(task_id: task_id)
    }
    func arama(arananKelime: String) {
        trepo.arama(arananKelime: arananKelime)
    }
    func taskYukle() {
        trepo.taskYukle()
    }
}
