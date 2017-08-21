//
//  appleProduct.swift
//  Apple Products
//
//  Created by Jeremy Tay on 18/08/2017.
//  Copyright © 2017 Jeremy Tay. All rights reserved.
//

import Foundation
import UIKit

class AppleProduct {
    var name: String
    var releaseDate : String
    var image : UIImage = UIImage()
    var wikiUrl: String
    
    // fomrat
    init(name: String, releaseDate: String, imageName: String, wikiUrl: String) {
        self.name = name
        self.releaseDate = releaseDate
        self.wikiUrl = wikiUrl
        
        if let imageApple = UIImage(named: imageName) {
            self.image = imageApple
        }
    }
}
