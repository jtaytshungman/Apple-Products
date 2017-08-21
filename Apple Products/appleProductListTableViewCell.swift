//
//  appleProductListTableViewCell.swift
//  Apple Products
//
//  Created by Jeremy Tay on 18/08/2017.
//  Copyright © 2017 Jeremy Tay. All rights reserved.
//

import UIKit

class appleProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productReleaseDate: UILabel!
    @IBOutlet weak var productImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
