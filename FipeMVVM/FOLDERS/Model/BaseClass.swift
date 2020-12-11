//
//  Brand.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import Foundation

class BaseClass: NSObject, protocolDictionary {
    
    //MARK:VARIAVEIS
    var name: String!
    var id: String!
    
    required init(fromDictionary dictionary: [String : Any]){
        self.name = dictionary["nome"] as? String
        self.id = dictionary["codigo"] as? String
        
        if id == nil {
            if let intId = dictionary["codigo"] as? Int {
                id = "\(intId)"
            }
        }
    }
}
