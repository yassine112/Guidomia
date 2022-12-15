//
//  CarsViewModel.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 13/12/2022.
//

import Foundation

protocol CarsViewModelProtocol {
    var loadDataHandler: () -> Void { get set }
    var cars: [CarViewModel] { get }
    
    func getCarsList()
    func displayDetail(_ section: Int)
}

class CarsViewModel: CarsViewModelProtocol {
    
    var loadDataHandler: () -> Void = { }
    
    private let manager: CarsManagerProtocol
    private(set) var cars: [CarViewModel] = []

    init(manager: CarsManagerProtocol) {
        self.manager = manager
    }
    
    func getCarsList() {
        manager.getCars { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let cars):
                self.cars = cars.map({ CarViewModel(using: $0, isExpanded: false) })
                self.cars[0].isExpanded = true
                self.loadDataHandler()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func displayDetail(_ section: Int) {
        for (index, _) in cars.enumerated() {
            cars[index].isExpanded = index == section
        }
        
        loadDataHandler()
    }
}
