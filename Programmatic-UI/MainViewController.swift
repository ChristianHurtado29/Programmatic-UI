//
//  ViewController.swift
//  Programmatic-UI
//
//  Created by Christian Hurtado on 1/28/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private let mainView = MainVIew()
    
    // if doing programmatic UI implement and setup the view in loadView()
    // loadView() gets called before viewDidLoad()
    // loadView() sets up the initial view of the contorller
    // do not call super when overrinding loadView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        configureNavBar()
    }
    
    private func configureNavBar() {
        // set title of navigation bar
        navigationItem.title = "Programmatic UI"
        
        // adding a UIBarButtonItem to the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
    }

    @objc
    private func showSettings(_ sender: UIBarButtonItem) {
        // segue to the SettingsViewController
        let settingsVC = SettingViewController()
        navigationController?.pushViewController(settingsVC, animated: true)

    }

}

