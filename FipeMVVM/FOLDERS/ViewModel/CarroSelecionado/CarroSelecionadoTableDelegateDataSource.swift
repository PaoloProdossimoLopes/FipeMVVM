//
//  CarroSelecionadoTableDelegateDataSource.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import Foundation
import UIKit

class CarroSelecionadoTableDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: VARIAVEIS
    var modelRequest = CarInfoRequest()
    var View = CarroSelecionadoViewController()
    //MARK: CONTRUTOR
    init(modelViewModel: CarInfoRequest, view: CarroSelecionadoViewController){
        self.modelRequest = modelViewModel
        self.View = view
       
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder)
    {
             fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return modelRequest.carnumberOFRow()
       
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "carSelected") as? carroSelecionadoTableViewCell {
            
            let carInfo = modelRequest.selectedCarArray[indexPath.row]
            cell.setup(car: carInfo)
            return cell
            
        }
        return UITableViewCell()
    }
}
