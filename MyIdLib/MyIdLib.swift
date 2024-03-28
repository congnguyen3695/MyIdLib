//
//  MyIdLib.swift
//  MyIdLib
//
//  Created by congnguyen on 26/02/2024.
//

import Foundation
import UIKit

public class MyIdLib: NSObject {

    var appConfig: MyIdLibConfig = MyIdLibConfig()
    var application: UIApplication!
    
    private static var myIdLib: MyIdLib!
    
    public static func shared() -> MyIdLib {
        if myIdLib == nil {
            myIdLib = MyIdLib()
        }
        return myIdLib
    }

    public func initial(_ application: UIApplication, appConfig: MyIdLibConfig? = nil) {
        self.application = application
        if let config = appConfig {
            self.appConfig = config
        }
    }
    
}
