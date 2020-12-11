//
//  CarroSelecionadoViewController.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import UIKit

class CarroSelecionadoViewController: UIViewController {
    
    //MARK: OUTLET
    @IBOutlet var carTableView: UITableView!
    
    //MARK: VARIAVEIS
    var marcaID: String?
    var anoID: String?
    var brand: Model?
    var viewRequest = CarInfoRequest()
    var typeModelDelegateDataSource: CarroSelecionadoTableDelegateDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = brand?.id {
            let idString = "\(id)"
            getCarInfo(id: idString)

        }
        self.title = "Carro Selecionado"
    }
    
    func getCarInfo(id: String) {
        let resquestURL = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(marcaID!)/modelos/\(anoID!)/anos/\(id)"
        //print(resquestURL)
        viewRequest.getCarsInfoMVVM(url: resquestURL, completionHandler: {success, _ in
            if success {
                
               self.configureTableView()
            }
        })
    }
    func configureTableView() {
        
        self.typeModelDelegateDataSource = CarroSelecionadoTableDelegateDataSource(modelViewModel: self.viewRequest, view: self)
        self.carTableView.delegate = typeModelDelegateDataSource
        self.carTableView.dataSource = typeModelDelegateDataSource
        self.carTableView.reloadData()
    }
}
