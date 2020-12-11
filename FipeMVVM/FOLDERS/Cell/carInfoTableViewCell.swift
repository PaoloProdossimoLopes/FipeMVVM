//
//  carInfoTableViewCell.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import UIKit

class carInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    //MARK: SETUPS
    func setup(brand: Brand){
        nameLabel.text = brand.name
    }
    
    
    func setupModel(model: Model) {
        nameLabel.text = model.name
    }
    
    
}
