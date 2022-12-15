//
//  CarsViewModel.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 13/12/2022.
//

import Foundation

protocol CarsViewModelProtocol {
    var loadDataHandler: () -> Void { get set }
    var filterdCars: [CarViewModel] { get }
    var makeList: [String] { get }
    var modelList: [String] { get }
    
    func getCarsList()
    func displayDetail(_ section: Int)
    func filterCarsUsing(make: String)
    func filterCarsUsing(model: String)
}

class CarsViewModel: CarsViewModelProtocol {
    
    var loadDataHandler: () -> Void = { }
    
    private let manager: CarsManagerProtocol
    private var cars: [CarViewModel] = []
    private(set) var filterdCars: [CarViewModel] = []
    private(set) var makeList   : [String] = []
    private(set) var modelList  : [String] = []

    init(manager: CarsManagerProtocol) {
        self.manager = manager
    }
    
    func getCarsList() {
        manager.getCars { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let cars):
                self.successDataLoading(cars: cars)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func displayDetail(_ section: Int) {
        for (index, _) in cars.enumerated() {
            cars[index].isExpanded = index == section
        }
        
        filterdCars = cars
        loadDataHandler()
    }
    
    func filterCarsUsing(make: String) {
        if make == "" {
            filterdCars = cars
        } else {
            filterdCars = cars.filter { $0.make.contains(make) }
        }
        
        loadDataHandler()
    }
    
    func filterCarsUsing(model: String) {
        if model == "" {
            filterdCars = cars
        } else {
            filterdCars = cars.filter { $0.model.contains(model) }
        }
        
        loadDataHandler()
    }
    
    private func successDataLoading(cars: [Car]) {
        self.cars = cars.map({ CarViewModel(using: $0, isExpanded: false) })
        self.cars[0].isExpanded = true
        self.filterdCars = self.cars
        
        makeList = cars.map { $0.make }
        makeList.insert("", at: 0)
        modelList = cars.map { $0.model }
        modelList.insert("", at: 0)
        self.loadDataHandler()
    }
}
