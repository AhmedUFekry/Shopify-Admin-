//
//  CopounsTableViewCell.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 13/03/2023.
//

import UIKit

class CopounsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var IDLabel: UILabel!
    
    @IBOutlet weak var NameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
