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
        
        
        setUpNavControllerApparence()
    }
    
    func start() {
        let manager     = CarsManager(loader: JSONDataLoader())
        let viewModel   = CarsViewModel(manager: manager)
        let controller  = CarsListViewController(viewModel: viewModel, coordinator: self)

        navigationController.pushViewController(controller, animated: false)
    }
    
    
    private func setUpNavControllerApparence() {
        navigationController.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "Orange")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
    }
    
}
