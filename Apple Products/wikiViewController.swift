//
//  wikiViewController.swift
//  Apple Products
//
//  Created by Jeremy Tay on 18/08/2017.
//  Copyright © 2017 Jeremy Tay. All rights reserved.
//

import UIKit

class wikiViewController: UIViewController {
    
    @IBOutlet weak var wikiWeb: UIWebView!

    var selectedAppleProduct : AppleProduct = AppleProduct(name: "", releaseDate: "", imageName: "", wikiUrl: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTheUrl(with: selectedAppleProduct.wikiUrl)
    }
    
    func loadTheUrl(with String: String) {
        
        guard let url = URL(string : String) else {
            print("Invalid urlString: \(String)")
            return
        }
        
        let request = URLRequest(url: url)
        wikiWeb.loadRequest(request)
        
    }
}
