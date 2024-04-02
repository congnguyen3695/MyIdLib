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
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MobileIdApplication.shared.delegate = self
    }

    @IBAction func onClick(_ sender: UIButton) {
        if textField.text?.isEmpty == true {
            statusLabel.text = "Phone is required"
            return
        }
        MobileIdApplication.shared.login(phone: textField.text ?? "",
                                         scope: "openid ip:phone_verify ip:mobile_id")
    }

}

extension ViewController: MobileIdApplicationDelegate {
    func verifyMobileIdDidFinish(_ data: MobileIdAuth?, _ error: NSError?) {
        if let data = data {
            statusLabel.text = data.toJSONString()
        } else {
            statusLabel.text = error?.localizedDescription ?? "Mobile id invalid"
        }
    }
    
    
}
