//
//  homePageViewController.swift
//  Apple Products
//
//  Created by Jeremy Tay on 18/08/2017.
//  Copyright © 2017 Jeremy Tay. All rights reserved.
//

import UIKit

class homePageViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var appleProducts : [AppleProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        self.title = "Apple Products"
        
        // list of apple products
        appleListofProducts()
    }
    
    // MARK: List of Apple 
    func appleListofProducts() {
        
        // ipad Mini 4
        let iPadMini4 = AppleProduct(
            name: "iPad Mini 4",
            releaseDate: "July 3rd",
            imageName: "ipadMini",
            wikiUrl: "https://en.wikipedia.org/wiki/IPad_Mini_4")
        appleProducts.append(iPadMini4)
        
        // apple watch
        let appleWatch = AppleProduct(
            name: "Apple Watch",
            releaseDate: "September 16th",
            imageName: "appleWatch",
            wikiUrl: "https://en.wikipedia.org/wiki/Apple_Watch")
        appleProducts.append(appleWatch)
        
        // iPhone
        let iPhone = AppleProduct(
            name: "iPhone SE",
            releaseDate: "September 30th",
            imageName: "iphone",
            wikiUrl: "https://en.wikipedia.org/wiki/Apple_iPhone")
        appleProducts.append(iPhone)
        
        let macPro = AppleProduct(
            name: "Macbook Pro",
            releaseDate: "September 30th",
            imageName: "macPro",
            wikiUrl: "https://en.wikipedia.org/wiki/Apple_macbook_pro")
        appleProducts.append(macPro)
        
        let macAir = AppleProduct(
            name: "Macbook Air",
            releaseDate: "September 30th",
            imageName: "macPro",
            wikiUrl: "https://en.wikipedia.org/wiki/Apple_macbook_air")
        appleProducts.append(macAir)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension homePageViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appleProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppleProductCell", for: indexPath) as? appleProductListTableViewCell
            else {
                return UITableViewCell()
        }
        
        let appleProd = appleProducts[indexPath.row]
        
        cell.productName.text = appleProd.name
        cell.productReleaseDate.text = appleProd.releaseDate
        cell.productImage.image = appleProd.image
        
        return cell
    }
    
}

extension homePageViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAppleProduct = appleProducts[indexPath.row]
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destination = mainStoryBoard.instantiateViewController(withIdentifier: "imageShowViewController") as? imageShowViewController else { return }
        
        destination.delagate = self as? imageShowViewControllerDelagate
        destination.showAppleProduct = selectedAppleProduct
        navigationController?.pushViewController(destination, animated: true)
    }
}

extension homePageViewController:  {
    func changeTitleTo(newName: String) {
        self.title = newName
    }
}
