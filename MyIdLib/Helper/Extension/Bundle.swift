//
//  Bundle.swift
//  MyIdLib
//
//  Created by congnguyen on 26/02/2024.
//

import Foundation

extension Bundle {
    var displayName: String? {
        object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
            object(forInfoDictionaryKey: "CFBundleName") as? String
    }
    var appVersion: String? {
            return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersion: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
