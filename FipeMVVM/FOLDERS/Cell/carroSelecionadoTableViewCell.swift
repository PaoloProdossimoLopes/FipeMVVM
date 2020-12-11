//
//  carroSelecionadoTableViewCell.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import UIKit

class carroSelecionadoTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet var marcaLabel: UILabel!
    @IBOutlet var modeloLabel: UILabel!
    @IBOutlet var anoLabel: UILabel!
    @IBOutlet var valorLabel: UILabel!
    @IBOutlet var combustivelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    
    //MARK: Setup
    func setup(car: CarSelected){
        marcaLabel.text = car.marca
        modeloLabel.text = car.modelo
        if let ano = car.ano {
            anoLabel.text = "\(ano)"
        }
        
        valorLabel.text = car.valor
        combustivelLabel.text = car.combustivel
        
    }

}
