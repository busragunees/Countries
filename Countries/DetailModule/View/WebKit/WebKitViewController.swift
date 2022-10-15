//
//  WebKitViewController.swift
//  Countries
//
//  Created by Büşra Güneş on 12.10.2022.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var wikiURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL.init(string: wikiURL){
            let urlRequest = URLRequest.init(url: url)
            webView.load(urlRequest)
        }
    }
}
