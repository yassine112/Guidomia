//
//  CarsViewModel.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 13/12/2022.
//

import Foundation

protocol CarsViewModelProtocol {
    var loadDataHandler: () -> Void { get set }
    
    func getCarsList()
}

class CarsViewModel: CarsViewModelProtocol {
    
    var loadDataHandler: () -> Void = { }
    
    private let manager: CarsManagerProtocol
    private var cars: [Car] = []

    init(manager: CarsManagerProtocol) {
        self.manager = manager
    }
    
    func getCarsList() {
        manager.getCars { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let cars):
                self.cars = cars
                self.loadDataHandler()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
