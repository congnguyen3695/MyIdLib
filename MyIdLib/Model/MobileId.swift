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
        accessToken <- map["access_token"]
        refreshToken <- map["refresh_token"]
        expiresIn <- map["expires_in"]
        refreshExpiresIn <- map["refresh_expires_in"]
        tokenType <- map["token_type"]
        idToken <- map["id_token"]
        notBeforePolicy <- map["not-before-policy"]
        sessionState <- map["session_state"]
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
        loginHint <- map["login_hint"]
        phoneNumberVerified <- map["phone_number_verified"]
        mobileId <- map["mobile_id"]
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
