//
//  protocolCarsInfo.swift
//  FipeMVVM
//
//  Created by Paolo Prodossimo Lopes on 2020-12-08.
//

import Foundation
import UIKit

protocol protocolCarsInfo {
    
    func getCarsInfoMVVM(completionHandler: @escaping (_ result: Bool, _ error: Error?) -> Void)

    func numberOfRows() -> Int
}
