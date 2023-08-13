//
//  TasksDaoRepository.swift
//  toDoApp
//
//  Created by Zeynep on 11.08.2023.
//

import Foundation
import RxSwift

class TasksDaoRepository {
    
    var taskListesi = BehaviorSubject<[Tasks]>(value: [Tasks]())
    func kaydet(task_name: String)
    {
        print("Task olusturuluyor... Task İçeriği: \(task_name)")
    }
    func guncelle(task_id:Int, task_name:String)
    {
        print("Task guncelle : \(task_id) - \(task_name) ")
    }
    
    func sil(task_id: Int) {
        print("Task sil: \(task_id)")
    }
    
    func arama(arananKelime: String) {
        print("Task ara: \(arananKelime)")
    }
    
    func taskYukle() {
        var liste = [Tasks]()
        let t1 = Tasks(task_id: 1, task_name: "Odev zamaninda teslim edilecek.")
        let t2 = Tasks(task_id: 2, task_name: "Eksik kalan videolar tamamlanacak.")
        liste.append(t1)
        liste.append(t2)
        taskListesi.onNext(liste) //tetikleme
    }
}
