//
//  CarsListViewController.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 13/12/2022.
//

import UIKit

class CarsListViewController: UIViewController {
    
    var coordinator : Coordinator
    var viewModel   : CarsViewModelProtocol
    
    @IBOutlet weak var tableView: UITableView!
    
    init(viewModel: CarsViewModelProtocol, coordinator: Coordinator) {
        self.viewModel      = viewModel
        self.coordinator    = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupHandlers()
        
        viewModel.getCarsList()
    }
    
    private func setupView() {
        tableView.delegate      = self
        tableView.dataSource    = self
        
//        tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
    }
    
    private func setupHandlers() {
        viewModel.loadDataHandler = { [weak self] in
            guard let self else { return }
            
            self.tableView.reloadData()
        }
    }

}

extension CarsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
}
