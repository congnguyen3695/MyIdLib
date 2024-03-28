//
//  MobileIdService.swift
//  MyIdLib
//
//  Created by congnguyen on 28/02/2024.
//

import Foundation

public class MobileIdService {
    
    public static func checkAvailable(phone: String, complition: ((_ response: MobileIdAvailable?)-> Void)? = nil) {
        let params: [String: String] = ["phone": phone]

        APIModel.request(link: MyIdLib.shared().appConfig.mode.url + "api/v1/mobile-id/available",
                         method: .get,
                         query: params,
                         success: {(data: BaseResponse<MobileIdAvailable>?) in
            complition?(data?.data)
        }, failure: {error in
            complition?(nil)
        })
    }
    
    public static func login(phone: String, scope: String, state: String? = nil, complition: ((_ user: MobileIdAuth?)-> Void)? = nil) {
        let vc = AuthController(nibName: "AuthController", bundle: Bundle(for: self))
        vc.phone = phone
        vc.state = state
        vc.scope = scope
        MyIdLib.shared().application.windows.first?.rootViewController?.present(vc, animated: true)
        vc.callback = {state, sessionState, code in
            if let sessionState = sessionState, let code = code {
                verify(code: code, sessionState: sessionState, state: state, complition: {data in
                    complition?(data)
                })
            } else {
                complition?(nil)
            }
        }
    }
    
    static func verify(code: String, sessionState: String, state: String?, complition: ((_ user: MobileIdAuth?)-> Void)? = nil) {
        var params: [String: Any] = ["sessionState": sessionState, "code": code]
        if let state = state {
            params["state"] = state
        }
        APIModel.request(link: MyIdLib.shared().appConfig.mode.url + "api/v1/mobile-id/verify-auth-code",
                         method: .post,
                         body: params,
                         success: {(data: BaseResponse<MobileIdAuth>?) in
            complition?(data?.data)
        }, failure: {error in
            complition?(nil)
        })
    }
    
    public static func getUserInfo(accessToken: String, complition: ((_ user: MobileIdUser?)-> Void)? = nil) {
        let params: [String: String] = ["accessToken": accessToken]

        APIModel.request(link: MyIdLib.shared().appConfig.mode.url + "api/v1/mobile-id/get-user-info",
                         method: .post,
                         query: params,
                         success: {(data: BaseResponse<MobileIdUser>?) in
            complition?(data?.data)
        }, failure: {error in
            complition?(nil)
        })
    }
}
