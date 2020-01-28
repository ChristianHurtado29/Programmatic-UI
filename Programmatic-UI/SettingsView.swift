//
//  SettingsView.swift
//  Programmatic-UI
//
//  Created by Christian Hurtado on 1/28/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    public lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        return pv
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commoninit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    
    private func commoninit(){
        // 1.
        addSubview(pickerView)
        // 2.
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        // 3.
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
