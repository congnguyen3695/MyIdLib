//
//  ViewController.swift
//  MyIdExample
//
//  Created by congnguyen on 26/02/2024.
//

import UIKit
import MyIdLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let config = MyIdLibConfig()
        config.apiKey = ""
        MyIdLib.shared().initial(appConfig: config)
    }


}

