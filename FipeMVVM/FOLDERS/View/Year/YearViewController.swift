//
//  YearViewController.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import UIKit

class YearViewController: UIViewController {
    
    //MARK: OUTLET
    @IBOutlet var yearTableView: UITableView!
    
    //MARK: VARIAVEIS
    var brand: Model?
    
    var marcas: String?
    var ano: String?
    
    var typeModelDelegateDataSource: YearModelTableViewDelegateDataSource?
    var viewRequest = CarInfoRequest()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = brand?.id {
            let idString = "\(id)"
            getCarInfo(id: idString)
            ano = idString
            

        }
        self.title = "Year"
        let nib = UINib(nibName: "carInfo", bundle: nil)
        yearTableView.register(nib, forCellReuseIdentifier: "carInfo")
    }
    
    func getCarInfo(id: String) {
        let resquestURL = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(marcas!)/modelos/\(id)/anos"
        viewRequest.getCarsInfoMVVM(url: resquestURL, completionHandler: {success, _ in
            if success {
                self.configureTableView()
            }
        })
    }
    
    func configureTableView() {
        
        self.typeModelDelegateDataSource = YearModelTableViewDelegateDataSource(modelViewModel: self.viewRequest, view: self)
        self.yearTableView.delegate = typeModelDelegateDataSource
        self.yearTableView.dataSource = typeModelDelegateDataSource
        self.yearTableView.reloadData()
    }
}
