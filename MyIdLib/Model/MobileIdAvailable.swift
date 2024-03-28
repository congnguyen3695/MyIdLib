//
//  MobileIdAvailable.swift
//  MyIdLib
//
//  Created by congnguyen on 28/03/2024.
//

import Foundation
import ObjectMapper

public class MobileIdAvailable: Mappable {
    var available: Bool?
    
    init() {}
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        available <- map["available"]
    }
    
    
}
