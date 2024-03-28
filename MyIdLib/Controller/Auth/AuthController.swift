//
//  AuthController.swift
//  MyIdLib
//
//  Created by congnguyen on 28/03/2024.
//

import UIKit
import WebKit

class AuthController: UIViewController {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var webview: WKWebView!
    
    var phone: String = ""
    var scope: String = ""
    var state: String?
    
    var callback: ((_ state: String?, _ sessionState: String?, _ code: String?)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = MyIdLib.shared().appConfig.mode.url + "api/v1/mobile-id/start-login?phone=" + phone + "&scope=" + scope
        if let state = state {
            url += "&state=" + state
        }
        url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        // Do any additional setup after loading the view.
        if let requestUrl = URL(string: url) {
            activityIndicatorView.startAnimating()
            let source: String = "var meta = document.createElement('meta');" +
                "meta.name = 'viewport';" +
                "meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';" +
                "var head = document.getElementsByTagName('head')[0];" +
                "head.appendChild(meta);"
            let script: WKUserScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
            let userContentController: WKUserContentController = WKUserContentController()
            let webConfiguration = WKWebViewConfiguration()
            webConfiguration.userContentController = userContentController
            userContentController.addUserScript(script)
            
            webview.uiDelegate = self
            webview.navigationDelegate = self
            webview.allowsBackForwardNavigationGestures = true
            webview.load(URLRequest(url: requestUrl))
            webview.backgroundColor = UIColor.clear
        } else {
            print("URL wrong format: " + url)
        }
    }

}

extension AuthController: WKUIDelegate, WKNavigationDelegate, UIScrollViewDelegate {
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
        if let url = webView.url, url.absoluteString.range(of: "auth-callback.html") != nil {
            guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
                  let queryItems = components.queryItems else { return }
            let param: [String: String] = queryItems.reduce(into: [String: String]()) {(result, item) in
                result[item.name] = item.value
            }
            dismiss(animated: true, completion: nil)
            callback?(param["state"], param["session_state"], param["code"])
        }
    }
    
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        if let error = error as? URLError {
            switch error.code {
            case .notConnectedToInternet:
                print("xxxx No internet connection")
            default:
                print("xxxx Network error: \(error.localizedDescription)")
            }
        }
        activityIndicatorView.stopAnimating()
        
    }
}
