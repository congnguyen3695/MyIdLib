//
//  Keychain.swift
//  MyIdLib
//
//  Created by congnguyen on 29/03/2024.
//

import Foundation
import KeychainAccess

extension Keychain {
    
    enum Key: String {
        case refreshTokenMobileId
    }
    
    private static var mainKeychainIdentifier = "Bundle.main.bundleIdentifier"
    
    static var main  = Keychain(service: Keychain.mainKeychainIdentifier)
    
    subscript(key: Key) -> String? {
        get {
            return self[key.rawValue]
        } set {
            self[key.rawValue] = newValue
        }
    }
    subscript(string key: Key) -> String? {
        get {
            return self[key.rawValue]
        } set {
            self[key.rawValue] = newValue
        }
    }
    subscript(key: Key) -> Data? {
        get {
            return self[data: key.rawValue]
        } set {
            self[data: key.rawValue] = newValue
        }
    }
//    subscript(attributes key: Key) -> Attributes? {
//        return self[attributes: key.rawValue]
//    }
    subscript(key: Key) -> Bool? {
        get {
            switch self[key.rawValue] {
            case .some("YES"): return true
            case .some("NO"): return false
            default: return nil
            }
        } set {
            switch newValue {
            case .some(true): self[key.rawValue] = "YES"
            case .some(false): self[key.rawValue] = "NO"
            case .none: do { try remove(key.rawValue) } catch {}
            }
        }
    }
    subscript(bool key: Key) -> Bool? {
        get {
            return self[key]
        } set {
            self[key] = newValue
        }
    }
}
