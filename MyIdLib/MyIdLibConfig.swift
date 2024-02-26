//
//  MyIdLibConfig.swift
//  MyIdLib
//
//  Created by congnguyen on 26/02/2024.
//

import Foundation
import UIKit

public class MyIdLibConfig {
    var appInfo: AppInfo?
    public var language: MyIdLanguageType = MyIdLanguageType.vi
    public var apiKey: String = ""
    
    public init() {
        
    }
}

class AppInfo {
    var appName: String = Bundle.main.displayName ?? ""
    var appId: String = Bundle.main.bundleIdentifier ?? ""
    var appVersion: String = Bundle.main.appVersion ?? ""
    var iosVersion: String = UIDevice.current.systemVersion

}

public enum MyIdLanguageType {
    case vi, en
}
