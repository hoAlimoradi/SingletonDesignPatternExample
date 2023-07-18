//
//  ViewController.swift
//  SingletonDesignPatternExample
//
//  Created by hoseinAlimoradi on 7/18/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let theme = AppSettings.shared.string(forKey: AppSettings.Constants.theme) {
            print("Theme: \(theme)")
        }
    }


}

