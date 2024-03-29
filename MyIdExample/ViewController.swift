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
        MobileIdApplication.shared.delegate = self
    }

    @IBAction func onClick(_ sender: UIButton) {
        MobileIdApplication.shared.login(phone: "99912345678908",
                                         scope: "openid ip:phone_verify ip:mobile_id")
    }

}

extension ViewController: MobileIdApplicationDelegate {
    func verifyMobileIdDidFinish(_ data: MobileIdAuth?) {
        if let data = data {
            print(data.toJSON())
        } else {
            print("Mobile id invalid")
        }
    }
    
    
}
