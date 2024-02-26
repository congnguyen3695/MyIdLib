//
//  MyIdLib.swift
//  MyIdLib
//
//  Created by congnguyen on 26/02/2024.
//

import Foundation

public class MyIdLib: NSObject {

    var appConfig: MyIdLibConfig = MyIdLibConfig()
    
    private static var myIdLib: MyIdLib!
    
    public static func shared() -> MyIdLib {
        if myIdLib == nil {
            myIdLib = MyIdLib()
        }
        return myIdLib
    }

    public func initial(appConfig: MyIdLibConfig? = nil) {
        if let config = appConfig {
            self.appConfig = config
        }
    }
    
}
