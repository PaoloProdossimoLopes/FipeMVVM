//
//  BrandTableViewCell.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import UIKit

class BrandTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    //MARK: SETUP
    func setup(brand: Model){
        nameLabel.text = brand.name
    }
}
