//
//  User.swift
//  MyIdLib
//
//  Created by congnguyen on 26/02/2024.
//

import Foundation
import ObjectMapper

public class User {
    var id: Int?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
    }
    
    
}
