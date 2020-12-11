//
//  BrandTableViewDelegateDataSource.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import Foundation
import UIKit

class BrandTableViewDelegateDataSource: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var brandViewModel = CarInfoRequest()
    var View = ViewController()
    
    init(brandViewModel: CarInfoRequest, view: ViewController) {
        self.brandViewModel = brandViewModel
        self.View = view
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder)
    {
             fatalError("init(coder:) has not been implemented")
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewcontroller = UIStoryboard(name: "typeModel", bundle: nil).instantiateInitialViewController() as? typeModelViewController{
            viewcontroller.brand = brandViewModel.modelArray[indexPath.row]
            View.navigationController?.pushViewController(viewcontroller, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brandViewModel.numberOfRows()
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell") as? BrandTableViewCell {
            
            let carInfo = brandViewModel.modelArray[indexPath.row]
            cell.setup(brand: carInfo)
            return cell
            
        }
        return UITableViewCell()
    }
}
