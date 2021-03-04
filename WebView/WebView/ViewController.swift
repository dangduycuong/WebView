//
//  ViewController.swift
//  WebView
//
//  Created by Dang Duy Cuong on 3/4/21.
//  Copyright © 2021 Dang Duy Cuong. All rights reserved.
//

import UIKit
import WebKit

class ViewController: BaseViewController {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let link = "https://www.hackingwithswift.com/read/4/2/creating-a-simple-browser-with-wkwebview"
        guard let url = URL(string: link) else {
            return
        }
        let request = URLRequest(url: url)
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
    }


}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showLoading()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideLoading()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        hideLoading()
    }
    
}
