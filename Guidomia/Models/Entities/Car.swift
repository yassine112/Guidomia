//
//  Car.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 13/12/2022.
//

import Foundation

struct Car: Codable {
    
    let consList        : [String]
    let customerPrice   : Int
    let make            : String
    let marketPrice     : Int
    let model           : String
    let prosList        : [String]
    let rating          : Int
}

struct CarViewModel {
    
    
    let title           : String
    let price           : String
    let imageName       : String
    let prosList        : [String]
    let consList        : [String]
    let rating          : Int
    
    var isExpanded      : Bool
    
    
    init(using car: Car, isExpanded: Bool) {
        self.title      = "\(car.make) \(car.model)"
        self.price      = "\(car.marketPrice / 1000)k"
        self.imageName  = car.model
        self.prosList   = car.prosList
        self.consList   = car.consList
        self.rating     = car.rating
        
        self.isExpanded = isExpanded
    }
    
}
