//
//  CarsListCell.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 13/12/2022.
//

import UIKit

class CarsListCell: UITableViewCell {
    
    @IBOutlet weak var prosBolletPoints: UILabel!
    @IBOutlet weak var consBolletPoints: UILabel!
    
    func fill(pros: String, cons: String) {
        prosBolletPoints.text = pros
        consBolletPoints.text = cons
    }
    
}
