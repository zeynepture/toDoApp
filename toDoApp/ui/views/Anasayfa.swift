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
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        
        let t1 = Tasks(task_id: 1, task_name: "Odev zamaninda teslim edilecek.")
        let t2 = Tasks(task_id: 2, task_name: "Eksik kalan videolar tamamlanacak.")
        
        tasksListesi.append(t1)
        tasksListesi.append(t2)
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
        print("Task ara: \(searchText)")
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
                print("Task sil: \(task.task_name!)")
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
       return UISwipeActionsConfiguration(actions: [silAction])
    }

}
