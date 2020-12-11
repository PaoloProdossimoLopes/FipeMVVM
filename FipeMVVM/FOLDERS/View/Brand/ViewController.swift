//
//  ViewController.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import UIKit

class ViewController: UIViewController {
    //MARK:OUTLET
    @IBOutlet var brandTableView: UITableView!
   
    //MARK:VARIAVEIS
    var viewRequest = CarInfoRequest()
    var brandDelegateDataSource: BrandTableViewDelegateDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCarInfo(id: "https://parallelum.com.br/fipe/api/v1/carros/marcas")
        // Do any additional setup after loading the view.
    }
    func getCarInfo(id: String) {
        let resquestURL = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(id)/modelos"
        viewRequest.getCarsInfoMVVM(url: id, completionHandler: { success, _ in
            if success {
                self.configureTableView()
            }
        })
    }
   
    func configureTableView() {
        self.brandDelegateDataSource = BrandTableViewDelegateDataSource(brandViewModel: self.viewRequest, view: self)
        self.brandTableView.delegate = brandDelegateDataSource
        self.brandTableView.dataSource = brandDelegateDataSource
        
        self.brandTableView.reloadData()
    }
}


