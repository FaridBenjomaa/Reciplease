//
//  WebViewController.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 31/07/2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var urlWebPage : String!
    
    let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let confguration = WKWebViewConfiguration()
        confguration.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero,
                                configuration: confguration)
        
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        guard let url = URL(string: urlWebPage!) else {
            return
        }
        webView.load(URLRequest(url: url))
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.webView.evaluateJavaScript("document.body.innerHTML") { result, error in
                guard let html = result as? String, error == nil else {
                    return
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }


}
