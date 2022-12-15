//
//  TopView.swift
//  Guidomia
//
//  Created by Yassine EL HALAOUI on 15/12/2022.
//

import UIKit

class TopView: UITableViewHeaderFooterView {

    @IBOutlet weak var filterViewContainer: UIView!
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    
    let makePicker = UIPickerView()
    let modelPicker = UIPickerView()
    
    var makeList: [String] = []
    var modelList: [String] = []

    
    var makeTFDidChanged: ((_ make: String) -> Void)?
    var modelTFDidChanged: ((_ model: String) -> Void)?

    func fill(makeList: [String], modelList: [String], makeTFDidChanged: @escaping ((_ make: String) -> Void), modelTFDidChanged: @escaping ((_ model: String) -> Void)) {
        self.filterViewContainer.layer.cornerRadius = 5.0
        
        self.makeList = makeList
        self.modelList = modelList
        
        self.makeTFDidChanged = makeTFDidChanged
        self.modelTFDidChanged = modelTFDidChanged
        
        makeTextField.inputView = makePicker
        modelTextField.inputView = modelPicker
        
        makePicker.delegate = self
        modelPicker.delegate = self
    }
    
    
}

extension TopView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case makePicker:
            return makeList.count
        case modelPicker:
            return modelList.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case makePicker:
            return makeList[row]
        case modelPicker:
            return modelList[row]
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case makePicker:
            makeTextField.text = makeList[row]
            makeTFDidChanged?(makeList[row])
            
        case modelPicker:
            modelTextField.text = modelList[row]
            modelTFDidChanged?(modelList[row])
            
        default:
            return
        }
        
        endEditing(true)
    }
    
}
