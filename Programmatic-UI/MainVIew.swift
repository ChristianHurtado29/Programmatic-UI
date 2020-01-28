//
//  MainVIew.swift
//  Programmatic-UI
//
//  Created by Christian Hurtado on 1/28/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class MainVIew: UIView {
    
    let defaultMessage = "No default color set. Please go to settings."
    
    // create a label
    public lazy var messageLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .systemGray3
        label.textAlignment = .center
        label.text = defaultMessage
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }() // () creates a closure and calls simultaneously
    // TODO: syntax terminology
    
//    var someLabel: UILabel = {
//        let label = UILabel()
//        label.text = defaultMessage
//        return label
//    }()
//
    // create a button
    public lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    

    // init(frame: ) gets called if view is done programatically
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    // if this view gets initialized from storyboard
    // this initializer gets called
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupMessageLabelConstraints()
        setupResetButtonContraints()
    }
    
    private func setupMessageLabelConstraints() {
        // add the messageLabel to the MainView
        addSubview(messageLabel) // return the messageLabel we created above
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // set top anchor 20 points from the safe area top
            messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            // max width = 414, max height = 688
            
            // set padding at the leading edge of the Main
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            // set padding at the trailing edge of the MainView
            
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            ])
    }
    
    private func setupResetButtonContraints() {
        addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40)
        ])
    }
    
}
