//
//  ViewController.swift
//  toDoApp
//
//  Created by Zeynep on 1.08.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tasksTableView: UITableView!
    
    var tasksListesi = [Tasks]()
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        _ = viewModel.taskListesi.subscribe(onNext: {liste in
            self.tasksListesi = liste
            self.tasksTableView.reloadData()
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.taskYukle()
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
extension Anasayfa : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.arama(arananKelime: searchText)
    }
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksListesi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasksListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "tasksHucre") as! TasksHucre
        hucre.labelTaskName.text = task.task_name
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasksListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: task)
        tableView.deselectRow(at: indexPath, animated: true) //secim kaldirma
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){  contextualAction, view, Bool in
            let task = self.tasksListesi[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: " \(task.task_name!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.viewModel.sil(task_id: task.task_id!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
       return UISwipeActionsConfiguration(actions: [silAction])
    }

}
