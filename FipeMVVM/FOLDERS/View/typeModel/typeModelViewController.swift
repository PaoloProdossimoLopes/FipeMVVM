//
//  typeModelViewController.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import UIKit

class typeModelViewController: UIViewController {
    
    
    //MARK: OUTLETS
    @IBOutlet var typeModelTableView: UITableView!
    
    //MARK: VARIAVEIS
    var brand: Model?
    var marcaID: String?
    var viewRequest = CarInfoRequest()
    var typeModelDelegateDataSource: typeModelTableViewDelegateDataSource?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = brand?.id {
            getCarInfo(id: id)
            marcaID = id
        }
        self.title = "Modelos"
        let nib = UINib(nibName: "carInfo", bundle: nil)
        typeModelTableView.register(nib, forCellReuseIdentifier: "carInfo")
    }
    
    func getCarInfo(id: String) {
        let resquestURL = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(id)/modelos"
        viewRequest.getCarsInfoMVVM(url: resquestURL, completionHandler: {success, _ in
            if success {
                self.configureTableView()
            }
        })
    }
    func configureTableView() {
        
        self.typeModelDelegateDataSource = typeModelTableViewDelegateDataSource(modelViewModel: self.viewRequest, view: self)
        self.typeModelTableView.delegate = typeModelDelegateDataSource
        self.typeModelTableView.dataSource = typeModelDelegateDataSource
        self.typeModelTableView.reloadData()
    }

}
