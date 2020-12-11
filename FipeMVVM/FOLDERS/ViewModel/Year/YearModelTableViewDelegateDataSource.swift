//
//  yearModelTableViewDelegateDataSource.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import Foundation
import UIKit

class YearModelTableViewDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: VARIAVEIS
    var modelRequest = CarInfoRequest()
    var View = YearViewController()
    
    //MARK: CONSTRUTOR
    init(modelViewModel: CarInfoRequest, view: YearViewController){
        self.modelRequest = modelViewModel
        self.View = view
       
    }
    required init?(coder aDecoder: NSCoder)
    {
             fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewcontroller = UIStoryboard(name: "CarroSelecionado", bundle: nil).instantiateInitialViewController() as? CarroSelecionadoViewController{
            print("here?")
            viewcontroller.brand = modelRequest.modelArray[indexPath.row]
            viewcontroller.marcaID = View.marcas
            viewcontroller.anoID = View.ano
            View.navigationController?.pushViewController(viewcontroller, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return modelRequest.numberOfRows()
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "yearInfo") as? YearTableViewCell {
            
            let carInfo = modelRequest.modelArray[indexPath.row]
            cell.setupModel(model: carInfo)
            return cell
            
        }
        return UITableViewCell()
    }
}
