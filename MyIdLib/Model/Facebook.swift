//
//  Facebook.swift
//  MyIdLib
//
//  Created by congnguyen on 26/02/2024.
//

import Foundation
import ObjectMapper

class Facebook: Mappable {
    var id: Int?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
    }
    
    
}
