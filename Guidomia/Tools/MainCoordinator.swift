//
//  MainCoordinator.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 13/12/2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let manager     = CarsManager(loader: JSONDataLoader())
        let viewModel   = CarsViewModel(manager: manager)
        let controller  = CarsListViewController(viewModel: viewModel, coordinator: self)

        navigationController.pushViewController(controller, animated: false)
    }
    
}
