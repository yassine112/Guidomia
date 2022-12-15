//
//  CarsSectionHeader.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 14/12/2022.
//

import UIKit

class CarsSectionHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var containerView : UIView!
    
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var starImg1 : UIImageView!
    @IBOutlet weak var starImg2 : UIImageView!
    @IBOutlet weak var starImg3 : UIImageView!
    @IBOutlet weak var starImg4 : UIImageView!
    @IBOutlet weak var starImg5 : UIImageView!
    
    var tapHeader: (() -> Void)?

    func fill(with car: CarViewModel, tapHeader: @escaping () -> Void) {
        containerView.backgroundColor = UIColor(named: "Light_Gray")
        
        imgView.image = UIImage(named: car.imageName)
        titleLbl.text = car.title
        priceLbl.text = car.price
        
        self.tapHeader = tapHeader
    }
    
    @IBAction func didTapHeader(_ sender: UIButton) {
        guard let tapHeader else { return }
        tapHeader()
    }

}
