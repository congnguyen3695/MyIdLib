//
//  AppDelegate.swift
//  MyIdExample
//
//  Created by congnguyen on 26/02/2024.
//

import UIKit
import MyIdLib

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let config = MyIdLibConfig()
        config.apiKey = "cf97cf53-6670-49df-bbdf-dceed604833b"
        config.mode = .dev
        MyIdLib.shared().initial(application, appConfig: config)
        return true
    }

}

