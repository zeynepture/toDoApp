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
    let db:FMDatabase?
    
    init() {
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    func kaydet(task_name: String)
    {
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO Tasks (task_name) VALUES (?)", values: [task_name])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    func guncelle(task_id:Int, task_name:String)
    {
        db?.open()
        do{
            try db!.executeUpdate("UPDATE Tasks SET task_name = ? WHERE task_id =? ", values: [task_name, task_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(task_id: Int) {
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM Tasks WHERE task_id = ?", values: [task_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func arama(arananKelime: String) {
        db?.open()
        var liste = [Tasks]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM Tasks WHERE task_name like '%\(arananKelime)%'", values: nil)
            
            while result.next() {
                let task_id = Int(result.string(forColumn: "task_id"))!
                let task_name = result.string(forColumn: "task_name")!
                
                let task = Tasks(task_id: task_id, task_name: task_name)
                liste.append(task)
            }
            taskListesi.onNext(liste)
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func taskYukle() {
        db?.open()
        var liste = [Tasks]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM Tasks", values: nil)
            
            while result.next() {
                let task_id = Int(result.string(forColumn: "task_id"))!
                let task_name = result.string(forColumn: "task_name")!
                
                let task = Tasks(task_id: task_id, task_name: task_name)
                liste.append(task)
            }
            taskListesi.onNext(liste)
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
