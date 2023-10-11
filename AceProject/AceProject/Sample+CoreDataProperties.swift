//
//  Sample+CoreDataProperties.swift
//  AceProject
//
//  Created by Adarsh Singh on 11/10/23.
//
//

import Foundation
import CoreData


extension Sample {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sample> {
        return NSFetchRequest<Sample>(entityName: "Sample")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: String?

}

extension Sample : Identifiable {

}
