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
        veritabanikopyala()
        taskListesi = trepo.taskListesi
    }
    func sil(task_id: Int) {
        trepo.sil(task_id: task_id)
        taskYukle()
    }
    func arama(arananKelime: String) {
        trepo.arama(arananKelime: arananKelime)
    }
    func taskYukle() {
        trepo.taskYukle()
    }
    func veritabanikopyala() {
        let bundleYolu = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
        //masaustune erismek icin
        let DosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: DosyaYolu).appendingPathComponent("todo.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: veritabaniURL.path()) {
            print("Veritabani mevcut.")
        }
        else {
            do {
                try fm.copyItem(atPath: bundleYolu!, toPath: veritabaniURL.path)
            }catch {
                print(error.localizedDescription)
            }
        }
    }
}
