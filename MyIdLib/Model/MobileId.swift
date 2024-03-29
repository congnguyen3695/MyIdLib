//
//  MobileIdAuth.swift
//  MyIdLib
//
//  Created by congnguyen on 28/03/2024.
//

import Foundation
import ObjectMapper

public class MobileIdAuth: Mappable {
    var accessToken: String?
    var refreshToken: String?
    var expiresIn: Int?
    var refreshExpiresIn: Int?
    var tokenType: String?
    var idToken: String?
    var notBeforePolicy: Int?
    var sessionState: String?
    var scope: String?
    var state: String?
    
    init() {}
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        accessToken <- map["accessToken"]
        refreshToken <- map["refreshToken"]
        expiresIn <- map["expiresIn"]
        refreshExpiresIn <- map["refreshExpiresIn"]
        tokenType <- map["tokenType"]
        idToken <- map["idToken"]
        notBeforePolicy <- map["notBeforePolicy"]
        sessionState <- map["sessionState"]
        scope <- map["scope"]
        state <- map["state"]
    }
    
    
}

public class MobileIdUser: Mappable {
    var sub: String?
    var loginHint: String?
    var phoneNumberVerified: String?
    var mobileId: String?
    
    init() {}
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        sub <- map["sub"]
        loginHint <- map["loginHint"]
        phoneNumberVerified <- map["phoneNumberVerified"]
        mobileId <- map["mobileId"]
    }
    
    
}

public class MobileIdAvailable: Mappable {
    var available: Bool?
    
    init() {}
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        available <- map["available"]
    }
    
    
}
