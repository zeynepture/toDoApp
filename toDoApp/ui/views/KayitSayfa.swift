//
//  KayitSayfa.swift
//  toDoApp
//
//  Created by Zeynep on 1.08.2023.
//

import UIKit

class KayitSayfa: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let tic = taskName.text {
            kaydet(task_name: tic)
        }
    }
    
    func kaydet(task_name: String)
    {
        print("Task olusturuluyor... Task İçeriği: \(task_name)")
    }
    
}
