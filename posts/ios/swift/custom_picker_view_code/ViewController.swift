//
//  ViewController.swift
//  ltt-swift-demo
//
//  Created by 林東東 on 2021/8/31.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func donePressed(_ sender: Any) {
        let dataSource = ["1","2","3","4","5",]
        
        let picker = LTTPickerView()
        picker.dataSource = dataSource
        picker.selectedRow = self.selectedRow
        picker.pickerTitleText = "項目選擇器"
        picker.pickerDoneBtnText = "完成"
        picker.pickerCancelBtnText = "取消"
        
        // 1
        picker.show(self) { row in
            print("done")
            print("view selected row = \(row)")
            
            let item = dataSource[row]
            print("view show item = \(item)")
            
            self.selectedRow = row
            self.lblTitle.text = item
        } cancelHandler: {
            print("cancel")
        }

        // 2
        picker.show(self,
                    dataSource: dataSource,
                    title: "項目選擇器") { row in
            print("done")
            print("view selected row = \(row)")

            let item = dataSource[row]
            print("view show item = \(item)")

            self.lblTitle.text = item
        } cancelHandler: {
            print("cancel")

        }
        
    }
    
}
