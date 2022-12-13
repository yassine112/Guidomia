//
//  CarsManager.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 13/12/2022.
//

import Foundation

protocol CarsManagerProtocol {
    func getCars(completion: @escaping (Result<[Car], Error>) -> Void)
}

class CarsManager: CarsManagerProtocol {
    let fileName = "car_list"
    let loader: DataLoaderProtocol
    
    init(loader: DataLoaderProtocol) {
        self.loader = loader
    }
    
    func getCars(completion: @escaping (Result<[Car], Error>) -> Void) {
        
        loader.load(fileName: fileName) { result in
            
            switch result {
                case .success(let data):
                    do {
                        let cars = try JSONDecoder().decode([Car].self, from: data)
                        completion(.success(cars))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let err):
                    completion(.failure(err))
            }
        }
    }
    
}
