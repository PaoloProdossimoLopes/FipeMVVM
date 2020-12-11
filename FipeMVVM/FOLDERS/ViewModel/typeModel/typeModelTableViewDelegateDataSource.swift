//
//  typeModel.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import Foundation
import UIKit

class typeModelTableViewDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var modelRequest = CarInfoRequest()
    var View = typeModelViewController()
    
    init(modelViewModel: CarInfoRequest, view: typeModelViewController){
        self.modelRequest = modelViewModel
        self.View = view
    }
    required init?(coder aDecoder: NSCoder)
    {
             fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let viewcontroller = UIStoryboard(name: "Year", bundle: nil).instantiateInitialViewController() as? YearViewController{
            viewcontroller.brand = modelRequest.modelArray[indexPath.row]
            viewcontroller.marcas = View.marcaID
            View.navigationController?.pushViewController(viewcontroller, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return modelRequest.numberOfRows()
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "carInfoCell") as? carInfoTableViewCell {
            
            let carInfo = modelRequest.modelArray[indexPath.row]
            cell.setupModel(model: carInfo)
            return cell
            
        }
        return UITableViewCell()
    }
}
