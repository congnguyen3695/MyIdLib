//
//  MyIdLibConfig.swift
//  MyIdLib
//
//  Created by congnguyen on 26/02/2024.
//

import Foundation
import UIKit

public class MyIdLibConfig {
    let appInfo: AppInfo = AppInfo()
    public var language: MyIdLanguageType = MyIdLanguageType.vi
    public var apiKey: String = ""
    public var mode: MyIdLibMode = MyIdLibMode.dev
    
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

public enum MyIdLibMode {
    case local
    case dev
    case prod
    
    var url: String {
        switch self {
        case .local: return "http://192.168.1.7:8088/"
        case .dev: return "http://210.211.97.224:1000/"
        case .prod: return "https://mobileid.vn/"
        }
    }
}
