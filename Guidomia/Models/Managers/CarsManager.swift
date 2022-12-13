//
//  CarsManager.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 13/12/2022.
//

import Foundation

protocol CarsManagerProtocol {
    func getCars() -> [Car]?
}

class CarsManager: CarsManagerProtocol {
    final let fileName = "car_list"
    
    func getCars() -> [Car]? {
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let carList = try JSONDecoder().decode([Car].self, from: data)
                return carList
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        return nil
    }
    
}
