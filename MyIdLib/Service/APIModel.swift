//
//  APIModel.swift
//  MyIdLib
//
//  Created by congnguyen on 26/02/2024.
//

import Foundation
//
//class APIModel {
//
//    let alamoFireManager: Session = {
//      let configuration = URLSessionConfiguration.af.default
//        configuration.timeoutIntervalForRequest = 30
//        configuration.timeoutIntervalForResource = 30
//      return Session(configuration: configuration)
//    }()
//
//    private static let headers = [
//        "x-api-key": "Touchspace2020"
//    ]
//
//    class func request<T: Mappable>(link: String,
//                                   method: HTTPMethod = .post,
//                                   parameters: [String: Any]?,
//                                   hash: Bool = false,
//                                   success: @escaping (_ data: T) -> Void,
//                                   failure: @escaping (_ error: NSError) -> Void) {
//        print(parameters ?? [:])
//        var headers: HTTPHeaders? = self.headers
//        var encoding: ParameterEncoding = URLEncoding.default
//        if hash {
////            headers = self.headers
//            headers?["Content-Type"] = "application/json"
//            headers?["Authorization"] = "Bearer " + (Service.accessJwtLaravel?.string ?? "")
//            headers?["Accept-Language"] = Localize.currentLanguage()
//            if method != .get {
//                encoding = JSONEncoding.default
//            }
//        }
//        alamoFireManager.request(Environment.apiBaseUrl + link,
//                                 method: method, parameters: parameters,
//                                 encoding: encoding,
//                                 headers: headers).responseData(completionHandler: { response in
//
//            switch response.result {
//            case .success(let result):
////                print(String(data: result, encoding: .utf8) ?? "")
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .customDate
//                do {
//                    let statusCode = response.response?.statusCode
//                    if statusCode == 200 {
//                        success(try decoder.decode(T.self, from: result))
//                    } else {
//                        let message = try decoder.decode(MessageResponse.self, from: result)
//                        let error = NSError.errorWith(code: statusCode ?? 0, message: message.message ?? "")
//                        failure(error)
//                    }
//                } catch let e {
//                    print(e)
//                    let error = NSError.errorWith(code: 0, message: e.localizedDescription)
//                    failure(error)
//                }
//            case .failure(let error):
//                print("failure", error)
//                failure(error as NSError)
//            }
//        })
//    }
//}
