//
//  BrandViewModel.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import Foundation
import Alamofire

class BrandViewModel: protocolCarsInfo{

    var brandArray = [Brand]()
    let apiManager = APIManager()
    
    func getCarsInfoMVVM(completionHandler: @escaping (_ result: Bool, _ error: Error?) -> Void){
        do{
            apiManager.request(url: "https://parallelum.com.br/fipe/api/v1/carros/marcas") {(json, jsonarray, errorStr) in
                
                        if json != nil {
                            print("json dicionario")
                        }
    
                        if let jsonObjct = jsonarray {
                            for item in jsonObjct {
                                let object = Brand(fromDictionary: item)
                                self.brandArray.append(object)
                            }
                        }
                    completionHandler(true, nil)
                }
        }catch{
            completionHandler(false, nil)
        }
    }
    
    func numberOfRows() -> Int {
        return brandArray.count ?? 0
    }
}

