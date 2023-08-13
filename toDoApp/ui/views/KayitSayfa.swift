//
//  KayitSayfa.swift
//  toDoApp
//
//  Created by Zeynep on 1.08.2023.
//

import UIKit

class KayitSayfa: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    var viewModel = KayitSayfaViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let tic = taskName.text {
            viewModel.kaydet(task_name: tic)
        }
    }
    
   
    
}
