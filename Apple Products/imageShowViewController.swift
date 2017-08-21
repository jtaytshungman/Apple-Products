//
//  imageShowViewController.swift
//  Apple Products
//
//  Created by Jeremy Tay on 18/08/2017.
//  Copyright © 2017 Jeremy Tay. All rights reserved.
//

import UIKit

class imageShowViewController: UIViewController {
    
    
    // MARK: Textfield, label and button declared
    @IBOutlet weak var productNameTextfield: UITextField!
    @IBOutlet weak var releaseDateTextfield: UITextField!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    var delagate : imageShowViewControllerDelagate?
    var showAppleProduct = AppleProduct(name: "", releaseDate: "", imageName: "", wikiUrl: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = showAppleProduct.name
        productNameLabel.text = showAppleProduct.name
        releaseDateLabel.text = showAppleProduct.releaseDate
        productImageView.image = showAppleProduct.image
    }

    // MARK: Text field hidden or appeared
    @IBAction func doneButtonTapped(_ sender: Any) {
        productNameTextfield.isHidden = true
        releaseDateTextfield.isHidden = true
        
        productNameLabel.isHidden = false
        releaseDateLabel.isHidden = false
        
        editButton.isHidden = false
        doneButton.isHidden = true
        
        showAppleProduct.name = productNameTextfield.text!
        showAppleProduct.releaseDate = releaseDateTextfield.text!
        
        productNameLabel.text = showAppleProduct.name
        releaseDateLabel.text = showAppleProduct.releaseDate
        
        self.title = showAppleProduct.name
    }
    @IBAction func editButtonTapped(_ sender: Any) {
        productNameTextfield.isHidden = false
        releaseDateTextfield.isHidden = false
        
        productNameLabel.isHidden = true
        releaseDateLabel.isHidden = true
        
        editButton.isHidden = true
        doneButton.isHidden = false
    }
    
    // MARK: Button Tapped functions
    @IBAction func viewWikiButtonTapped(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destination = mainStoryboard.instantiateViewController(withIdentifier: "wikiViewController") as? wikiViewController else {return}
        destination.selectedAppleProduct = showAppleProduct
        
        navigationController?.pushViewController(destination, animated: true)
    }
    @IBAction func changeTitleButtonTapped(_ sender: Any) {
        delagate?.changeTitleTo(newName: showAppleProduct.name)
    }
}

protocol imageShowViewControllerDelagate {
    func changeTitleTo(newName: String)
}
