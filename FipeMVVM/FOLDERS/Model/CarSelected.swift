//
//  CarSelected.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import Foundation
class CarSelected: NSObject {
    //MARK: VARIAVEIS
    var modelo: String!
    var ano: Int!
    var valor: String!
    var marca: String!
    var combustivel: String!
    
    //MARK:CONTRUTOR
    init(fromDicationary dictionary: [String: Any]){
        self.modelo = dictionary["Modelo"] as? String
        self.ano = dictionary["AnoModelo"] as? Int
        self.valor = dictionary["Valor"] as? String
        self.marca = dictionary["Marca"] as? String
        self.combustivel = dictionary["Combustivel"] as? String
     }
}
