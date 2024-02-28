//
//  MobileIdService.swift
//  MyIdLib
//
//  Created by congnguyen on 28/02/2024.
//

import Foundation

public class MobileIdService {
    
    static func login(username: String, complition: ((_ user: User?)-> Void)? = nil) {
        let user = User()
        user.id = 100000
        complition?(user)
    }
}
