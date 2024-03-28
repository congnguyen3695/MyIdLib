//
//  User.swift
//  MyIdLib
//
//  Created by congnguyen on 26/02/2024.
//

import Foundation
import ObjectMapper

public class MobileIdUser: Mappable {
    var id: Int?
    
    init() {}
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
    }
    
    
}
