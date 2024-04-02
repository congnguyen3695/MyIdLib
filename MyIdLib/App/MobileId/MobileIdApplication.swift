//
//  MobileIdApplication.swift
//  MyIdLib
//
//  Created by congnguyen on 28/02/2024.
//

import Foundation
import KeychainAccess

public class MobileIdApplication {
    public var delegate: MobileIdApplicationDelegate?
    var mobileIdAuth: MobileIdAuth?
    
    public static let shared = MobileIdApplication()
    
    public func checkAvailable(phone: String, complition: ((_ response: MobileIdAvailable?, _ error: NSError?)-> Void)? = nil) {
        let params: [String: String] = ["phone": phone]

        APIModel.request(link: MyIdLib.shared().appConfig.mode.url + "api/v1/mobile-id/available",
                         method: .get,
                         query: params,
                         success: {(data: BaseResponse<MobileIdAvailable>?) in
            complition?(data?.data, nil)
        }, failure: {error in
            complition?(nil, error)
        })
    }
    
    public func login(phone: String, scope: String, state: String? = nil) {
        let vc = AuthController(nibName: "AuthController", bundle: Bundle(for: AuthController.self))
        vc.phone = phone
        vc.state = state
        vc.scope = scope
        MyIdLib.shared().application.windows.first?.rootViewController?.present(vc, animated: true)
        vc.callback = {[weak self] (state, sessionState, code) in
            if let sessionState = sessionState, let code = code {
                self?.verify(code: code, sessionState: sessionState, state: state)
            } else {
                let error = NSError.init(domain: "myid.vn",
                                         code: 400,
                                         userInfo: [NSLocalizedDescriptionKey: "Phone is not support"])
                self?.delegate?.verifyMobileIdDidFinish(nil, error)
            }
        }
    }
    
    func verify(code: String, sessionState: String, state: String?) {
        var params: [String: Any] = ["sessionState": sessionState, "code": code]
        if let state = state {
            params["state"] = state
        }
        APIModel.request(link: MyIdLib.shared().appConfig.mode.url + "api/v1/mobile-id/verify-auth-code",
                         method: .post,
                         body: params,
                         success: {[weak self] (data: BaseResponse<MobileIdAuth>?) in
            if let _ = data?.data?.accessToken,  let refreshToken = data?.data?.refreshToken {
                Keychain.main[.refreshTokenMobileId] = refreshToken
                self?.mobileIdAuth = data?.data
            }
            self?.delegate?.verifyMobileIdDidFinish(data?.data, nil)
        }, failure: {[weak self] error in
            self?.delegate?.verifyMobileIdDidFinish(nil, error)
        })
    }
    
    public func getUserInfo(complition: ((_ user: MobileIdUser?)-> Void)? = nil) {
        let params: [String: String] = ["accessToken": mobileIdAuth?.accessToken ?? ""]

        APIModel.request(link: MyIdLib.shared().appConfig.mode.url + "api/v1/mobile-id/get-user-info",
                         method: .post,
                         query: params,
                         success: {(data: BaseResponse<MobileIdUser>?) in
            complition?(data?.data)
        }, failure: {error in
            complition?(nil)
        })
    }
    
    public func hasPreviousSignIn() -> Bool {
        return Keychain.main[string: .refreshTokenMobileId] != nil
    }
    
    public func restorePreviousSignIn() {
        let params: [String: String] = ["refreshToken": Keychain.main[string: .refreshTokenMobileId] ?? ""]
        APIModel.request(link: MyIdLib.shared().appConfig.mode.url + "api/v1/mobile-id/restore-access-token",
                         method: .post,
                         body: params,
                         success: {[weak self] (data: BaseResponse<MobileIdAuth>?) in
            if let _ = data?.data?.accessToken,  let refreshToken = data?.data?.refreshToken {
                Keychain.main[.refreshTokenMobileId] = refreshToken
                self?.mobileIdAuth = data?.data
            }
            self?.delegate?.verifyMobileIdDidFinish(data?.data, nil)
        }, failure: {[weak self] error in
            self?.delegate?.verifyMobileIdDidFinish(nil, error)
        })
    }
    
    public func logout() {
        self.mobileIdAuth = nil
        Keychain.main[string: .refreshTokenMobileId] = nil
    }
    
}

public protocol MobileIdApplicationDelegate {
    func verifyMobileIdDidFinish(_ data: MobileIdAuth?, _ error: NSError?)
    
}
