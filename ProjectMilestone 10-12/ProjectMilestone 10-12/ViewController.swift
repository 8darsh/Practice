//
//  ViewController.swift
//  ProjectMilestone 10-12
//
//  Created by Adarsh Singh on 09/09/23.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addImages))
        self.tableView.rowHeight = 100
        
        let defaults = UserDefaults.standard

        if let savedPeople = defaults.object(forKey: "people") as? Data {
            let jsonDecoder = JSONDecoder()

            do {
                people = try jsonDecoder.decode([Person].self, from: savedPeople)
            } catch {
                print("Failed to load people")
            }
        }
        
    }
    @objc func addImages(){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else
        {return}
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appending(path: imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8){
            try? jpegData.write(to: imagePath)
        }
        DispatchQueue.main.async {
            self.dismiss(animated: true)
            
            let ac = UIAlertController(title: "Caption?", message: "Name", preferredStyle: .alert)
            ac.addTextField()
            ac.addAction(UIAlertAction(title: "Ok", style: .default){
                [weak ac] _ in
                guard let caption = ac?.textFields?[0].text else {return}
                let peoples = Person(name: caption, img: imageName)
                self.people.append(peoples)
                self.save()
                self.tableView.reloadData()
            })
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            self.present(ac, animated: true)
        }
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func save(){
        
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(people){
            
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "people")
        }else{
            print("Failed to save people")
        }
            
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            people.remove(at: indexPath.row)
            
            DispatchQueue.global().async { [weak self] in
                if let pictures = self?.people {
                    self?.save()
                }
                
                DispatchQueue.main.async {
                    self?.tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            }
        }
    }



}

extension ViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.imgLbl.text = people[indexPath.row].name
        let path = getDocumentsDirectory().appending(path: people[indexPath.row].img)
        cell.imageView?.image = UIImage(contentsOfFile: path.path())
        save()
        cell.imgView?.layer.cornerRadius = 5
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        let path = getDocumentsDirectory().appending(path: people[indexPath.row].img)
        vc.n = path
        vc.picture = people
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

