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
    var prosList        : String
    var consList        : String
    let rating          : Int
    
    var isExpanded      : Bool
    
    
    init(using car: Car, isExpanded: Bool) {
        self.title      = "\(car.make) \(car.model)"
        self.price      = "\(car.marketPrice / 1000)k"
        self.imageName  = car.model
        self.rating     = car.rating
    
        // TODO: Check back to line, "\n" not working
        
        self.prosList = ""
        for item in car.prosList {
            self.prosList += " • \(item)\n"
        }
        
        self.consList = ""
        for item in car.consList {
            self.consList += " • \(item)\n"
        }
        
        self.isExpanded = isExpanded
    }
    
}
