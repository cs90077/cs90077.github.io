//
//  ViewController.swift
//  ltt-swift-demo
//
//  Created by 林東東 on 2021/8/31.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
        
    @IBOutlet weak var tfAge: UITextField!
    
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        tfAge.addTarget(self, action: #selector(showAgePickerView), for: .touchDown)
    }
    
    @objc func showAgePickerView() {
        let dataSource = ["18","19","20","21","22","23","24","25",]
        let picker = LTTPickerView()
        picker.dataSource = dataSource
        picker.selectedRow = self.selectedRow
        picker.pickerTitleText = "請選擇年紀"
        picker.pickerDoneBtnText = "完成"
        picker.pickerCancelBtnText = "取消"
        
        picker.show(self) { row in
            print("done")
            print("view selected row = \(row)")
            
            let item = dataSource[row]
            print("view show item = \(item)")
            
            self.selectedRow = row
            self.tfAge.text = item
        } cancelHandler: {
            print("cancel")
        }
    }
    
}
