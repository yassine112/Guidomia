//
//  CarsSectionHeader.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 14/12/2022.
//

import UIKit

class CarsSectionHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var starImg1 : UIImageView!
    @IBOutlet weak var starImg2 : UIImageView!
    @IBOutlet weak var starImg3 : UIImageView!
    @IBOutlet weak var starImg4 : UIImageView!
    @IBOutlet weak var starImg5 : UIImageView!

    func fill(with car: Car) {
        imgView.image = UIImage(named: car.model)
        titleLbl.text = "\(car.make) \(car.model)"
        priceLbl.text = "\(car.marketPrice)"
    }

}
