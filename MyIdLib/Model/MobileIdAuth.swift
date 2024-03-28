//
//  MobileIdAuth.swift
//  MyIdLib
//
//  Created by congnguyen on 28/03/2024.
//

import Foundation
import ObjectMapper

public class MobileIdAuth: Mappable {
    var id: Int?
    
    init() {}
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
    }
    
    
}
