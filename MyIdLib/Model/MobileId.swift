//
//  MobileIdAuth.swift
//  MyIdLib
//
//  Created by congnguyen on 28/03/2024.
//

import Foundation
import ObjectMapper

public class MobileIdAuth: Mappable {
    public var accessToken: String?
    public var refreshToken: String?
    public var expiresIn: Int?
    public var refreshExpiresIn: Int?
    public var tokenType: String?
    public var idToken: String?
    public var notBeforePolicy: Int?
    public var sessionState: String?
    public var scope: String?
    public var state: String?
    
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
    public var sub: String?
    public var loginHint: String?
    public var phoneNumberVerified: Bool?
    public var mobileId: String?
    
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
    public var available: Bool?
    
    init() {}
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        available <- map["available"]
    }
    
    
}
