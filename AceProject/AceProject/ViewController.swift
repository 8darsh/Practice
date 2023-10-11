//
//  ViewController.swift
//  AceProject
//
//  Created by Adarsh Singh on 11/10/23.
//This is using CoreData Database

import UIKit

class ViewController: UITableViewController {
    
    var sample = [Sample]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Database Storage"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addData))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sample = DatabaseManager.shared.getData()
        self.tableView.reloadData()
    }
    @objc func addData(){
        let ac = UIAlertController(title: "Add Data", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Save", style: .default){
            _ in
            let dic = [
                "name": "\(ac.textFields![0].text ?? "hehe")",
                "type": "\(ac.textFields![1].text ?? "lala")"
            ]
            DatabaseManager.shared.save(object: dic)
            self.sample = DatabaseManager.shared.getData()
            self.tableView.reloadData()
        })
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac,animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sample.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SampleTableViewCell
        cell.name.text = sample[indexPath.row].name
        cell.type.text = sample[indexPath.row].type
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            sample = DatabaseManager.shared.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return UITableView.automaticDimension
//    }


}

