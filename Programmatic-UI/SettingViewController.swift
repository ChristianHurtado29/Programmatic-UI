//
//  SettingViewController.swift
//  Programmatic-UI
//
//  Created by Christian Hurtado on 1/28/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

struct AppKey {
    static let appColorKey = "app color"
    static let indexKey = "index Key"
}

class SettingViewController: UIViewController {
    
    private let settingsView = SettingsView()
    
    // data for pickerView
    private let colors = ["Red", "Green", "Orange", "Blue", "Bubblegum", "Sky", "Cyan", "White", "Yellow", "Lime"]
    
    override func loadView() {
        view = settingsView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        loadView()
        
        // configure delegate and datasource of pickerview
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        // TODO: Fix bug below!
        updateRow()
    }
    
    
    private func updateRow() {
        if let row = UserDefaults.standard.object(forKey: AppKey.indexKey) as? Int {
            settingsView.pickerView.selectRow(row, inComponent: 0, animated: true)
            view.backgroundColor = UIColor(named: colors[row])
        } else {
            
        }
    }
    
}

extension SettingViewController:UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        colors.count
    }
    
    
}


extension SettingViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let colorName = colors[row]
        view.backgroundColor = UIColor(named: colorName)
        
        // save color name to user defaults
        UserDefaults.standard.set(colorName, forKey: AppKey.appColorKey)
        UserDefaults.standard.set(row, forKey: AppKey.indexKey)
    }
    
}
