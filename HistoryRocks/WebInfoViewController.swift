//
//  WebInfoViewController.swift
//  HistoryRocks
//
//  Created by Peter Reichl on 8/30/18.
//  Copyright © 2018 Peter Reichl. All rights reserved.
//

import UIKit
import  WebKit

class WebInfoViewController: UIViewController {
    
    
    @IBOutlet weak var webViewInfo: WKWebView!
    
    

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let urlString = selectedEvent.eventLink
        let url: URL = URL(string: urlString)!
        let urlRequest: URLRequest = URLRequest(url: url)
        webViewInfo.load(urlRequest)
    }
    

}
