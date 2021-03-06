//
//  FirstRoundModelData.swift
//  FirstRoundTest
//
//  Created by Caston  Boyd on 7/9/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import Foundation

struct TopLevelData: Codable {
    
    let restaurants: [Restaurant]
}
struct Restaurant: Codable {
    
    var address: String
    var city: String
    var inspectionDate: String
    var name: String
    var major: Int
    var minor: Int
    var violationTitle: String
    
    enum CodingKeys: String, CodingKey {
        
        case address = "address"
        case city = "city"
        case inspectionDate = "inspection date"
        case name =  "name"
        case major = "major"
        case minor = "minor"
        case violationTitle = "violationTitle"
    }
    
}
