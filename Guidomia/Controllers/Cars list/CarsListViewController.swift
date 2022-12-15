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
        title = "Guidomia"
        
        tableView.delegate      = self
        tableView.dataSource    = self
        
        tableView.register(UINib(nibName: "CarsListCell", bundle: nil), forCellReuseIdentifier: "CarsListCell")
        tableView.register(UINib(nibName: "CarsSectionHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "CarsSectionHeader")
        tableView.register(UINib(nibName: "CarsSectionFooter", bundle: nil), forHeaderFooterViewReuseIdentifier: "CarsSectionFooter")
        
    }
    
    private func setupHandlers() {
        viewModel.loadDataHandler = { [weak self] in
            guard let self else { return }
            
            self.tableView.reloadData()
        }
    }

}

extension CarsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.cars.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cars[section].isExpanded ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CarsListCell", for: indexPath) as? CarsListCell {
            return  cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CarsSectionHeader") as? CarsSectionHeader {
            header.fill(with: viewModel.cars[section]) { [weak self] in
                self?.viewModel.displayDetail(section)
            }
            return header
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CarsSectionFooter") as? CarsSectionFooter {
            return footer
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        124
    }
}
