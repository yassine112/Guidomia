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
