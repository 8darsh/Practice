//
//  DatabaseManager.swift
//  AceProject
//
//  Created by Adarsh Singh on 11/10/23.
//

import Foundation
import CoreData
import UIKit

class DatabaseManager{
    
    static let shared = DatabaseManager()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String]){
        
        let sample = NSEntityDescription.insertNewObject(forEntityName: "Sample", into: context!) as! Sample
        sample.name = object["name"]
        sample.type = object["type"]
        
        do{
            try context?.save()

        }catch{
            print("Not Saved")
        }
    }
    
    func getData() -> [Sample]{
        var sample = [Sample]()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Sample")
        
        do{
            sample = try context?.fetch(fetchRequest) as! [Sample]
        }catch{
            print("cant'get the data")
        }
        
        return sample
    }
    
    func deleteData(index: Int) -> [Sample]{
        
        var sample = getData()
        context?.delete(sample[index])
        sample.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("Can't get Data")
        }
        return sample
    }
}
