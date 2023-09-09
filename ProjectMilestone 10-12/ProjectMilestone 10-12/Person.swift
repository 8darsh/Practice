//
//  Person.swift
//  ProjectMilestone 10-12
//
//  Created by Adarsh Singh on 09/09/23.
//

import Foundation

class Person: Codable{
    
    var name: String
    var img: String
    
    init(name: String, img: String) {
        self.name = name
        self.img = img
    }
}
