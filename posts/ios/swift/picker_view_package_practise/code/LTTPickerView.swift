//
//  LTTPickerView.swift
//  ltt-swift-demo
//
//  Created by 林東東 on 2021/9/10.
//

import Foundation
import UIKit

class LTTPickerView: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // done
    typealias CompletionHandler = ((_ row: Int) -> Void)
    var completionHandler:CompletionHandler?
    
    // cnacel
    typealias CancelHandler = (() -> Void)
    var cancelHandler:CancelHandler?
    
    var pickerTitleText: String?
    var pickerDoneBtnText: String?
    var pickerCancelBtnText: String?
    
    var dataSource: [String] = []
    var selectedRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func donePressed(_ sender: Any) {
        dismiss(animated: true) {
            if let handler = self.completionHandler {
                handler(self.selectedRow)
            }
        }
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true) {
            if let handler = self.cancelHandler {
                handler()
            }
        }
    }
    
    private func setupView() {
        self.lblTitle.text = "title"
        self.btnDone.setTitle("done", for: .normal)
        self.btnCancel.setTitle("cancel", for: .normal)
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        self.pickerView.selectRow(selectedRow, inComponent: 0, animated: true)
        setupCustomView()
    }
    
    private func setupCustomView() {
        // setup
        if let text = self.pickerTitleText {
            self.lblTitle.text = text
        }
        
        if let text = self.pickerDoneBtnText {
            self.btnDone.setTitle(text, for: .normal)
        }
        
        if let text = self.pickerCancelBtnText {
            self.btnCancel.setTitle(text, for: .normal)
        }
    }
    
    
}

// MARK: Func

extension LTTPickerView {
    
    func show(_ viewController:UIViewController,
              doneHandler:@escaping CompletionHandler,
              cancelHandler:@escaping CancelHandler) {
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
        self.completionHandler = doneHandler
        self.cancelHandler = cancelHandler
        viewController.present(self, animated: true, completion: nil)
    }
    
}

// MARK: UIPickerViewDataSource

extension LTTPickerView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
}

// MARK: UIPickerViewDelegate

extension LTTPickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var txt = ""
        if dataSource.count > row {
            txt = dataSource[row]
        }
        
        return txt
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedRow = row
        
        print("picker selected row = \(row)")
        
        let item = dataSource[row]
        print("picker show item = \(item)")
    }
    
}
