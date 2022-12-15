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
        tableView.register(UINib(nibName: "TopView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TopView")
        
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
        viewModel.filterdCars.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        
        return viewModel.filterdCars[section - 1].isExpanded ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CarsListCell", for: indexPath) as? CarsListCell {
            let car = viewModel.filterdCars[indexPath.section - 1]
            cell.fill(pros: car.prosList, cons: car.consList)
            return  cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TopView") as? TopView {
                header.fill(makeList: viewModel.makeList, modelList: viewModel.modelList) { make in
                    self.viewModel.filterCarsUsing(make: make)
                } modelTFDidChanged: { model in
                    self.viewModel.filterCarsUsing(model: model)
                }


                return header
            }
        } else {
            if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CarsSectionHeader") as? CarsSectionHeader {
                header.fill(with: viewModel.filterdCars[section - 1]) { [weak self] in
                    self?.viewModel.displayDetail(section - 1)
                }
                return header
            }
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section != 0, let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CarsSectionFooter") as? CarsSectionFooter {
            return footer
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 390 : 120
    }
}
