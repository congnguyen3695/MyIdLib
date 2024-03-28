//
//  ViewController.swift
//  MyIdExample
//
//  Created by congnguyen on 26/02/2024.
//

import UIKit
import MyIdLib

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onClick(_ sender: UIButton) {
        MobileIdService.login(phone: "99912345678908", scope: "openid ip:phone_verify ip:mobile_id", state: "9805b26d-4445-45d1-b458-8b8a598jhy79", complition: {response in
            print(response)
        })
    }

}

