//
//  MessageResponse.swift
//  MyIdLib
//
//  Created by congnguyen on 27/02/2024.
//

import Foundation

import Foundation
import ObjectMapper

final class BaseResponse<T: Mappable>: Mappable {
    
    var message: String?
    var data: T?
    
    required init() {}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        message <- map["message"]
        data <- map["data"]
    }
}

final class BaseArrayResponse<T: Mappable>: Mappable {
    
    var message: String?
    var data: [T]?
    var totalRecord: Int?
    
    required init() {}
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        message <- map["message"]
        data <- map["data"]
        totalRecord <- map["totalRecord"]
    }
}

final class MessageResponse: Mappable {
    var message: String?

    required init() {}
    required init?(map: Map) {}
    
    static func mock() -> Self {
        let obj = self.init()
        
        return obj
    }
    
    func mapping(map: Map) {
        message <- map["message"]
    }
}
