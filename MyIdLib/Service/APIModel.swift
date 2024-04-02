//
//  APIModel.swift
//  MyIdLib
//
//  Created by congnguyen on 26/02/2024.
//

import Foundation
import Alamofire
import ObjectMapper

class APIModel {

    private static let alamoFireManager: Session = {
      let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
      return Session(configuration: configuration)
    }()

    class func request<T: Mappable>(link: String,
                                   method: HTTPMethod = .post,
                                    query: [String: String]? = nil,
                                    body: [String: Any]? = nil,
                                    header: HTTPHeaders? = nil,
                                   success: @escaping (_ data: T) -> Void,
                                   failure: @escaping (_ error: NSError) -> Void) {
        var headers: HTTPHeaders = ["Content-Type": "application/json",
                                    "API_KEY": MyIdLib.shared().appConfig.apiKey]
        if let h = header {
            for (key, value) in h.dictionary {
                headers[key] = value
            }
        }
        alamoFireManager.request(link,
                                 method: method,
                                 parameters: body,
                                 encoding: method == .get ? URLEncoding.default : JSONEncoding.default,
                                 headers: headers)
                        .responseString { response in
            switch response.result {
            case .success(let result):
                let statusCode = response.response?.statusCode ?? 0
                if let res = T(JSONString: result), statusCode == 200 {
                    success(res)
                } else {
                    let message = MessageResponse(JSONString: result)
                    let error = NSError.init(domain: "myid.vn",
                                             code: statusCode,
                                             userInfo: [NSLocalizedDescriptionKey: message?.message ?? "error"])
                    failure(error)
                }
            case .failure(let error):
                print("failure", error)
                failure(error as NSError)
            }
        }
    }
}
