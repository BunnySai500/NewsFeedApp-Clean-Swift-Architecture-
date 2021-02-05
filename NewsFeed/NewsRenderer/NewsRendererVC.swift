//
//  NewsRendererVC.swift
//  NewsFeed
//
//  Created by Bunny Bhargav on 05/02/21.
//  Copyright © 2021 Bunny Bhargav. All rights reserved.
//

import UIKit
import WebKit

class NewsRendererVC: UIViewController {
    private var webView: WKWebView!
    var request: URLRequest?
    override func viewDidLoad() {
        super.viewDidLoad()
    if let req = request
    {
    webView.load(req)
    }
    }
    override func loadView() {
    webView = WKWebView()
    self.view = webView
    }
}
