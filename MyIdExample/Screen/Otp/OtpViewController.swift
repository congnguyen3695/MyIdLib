//
//  OtpViewController.swift
//  MyIdExample
//
//  Created by congnguyen on 04/04/2024.
//

import UIKit
import MyIdLib

class OtpViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    var phone: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Mã xác thực đã được gửi về số điện thoại \(phone)"
        MobileIdApplication.shared.sendOtp(phone: phone)
    }


    @IBAction func onClick(_ sender: UIButton) {
        if textField.text?.isEmpty == true {
            let alert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập mã xác thực", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Đóng", style: UIAlertAction.Style.cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        MobileIdApplication.shared.verifyOtp(phone: phone, code: textField.text ?? "", completion: {[weak self] data, error in
            if error == nil {
                let vc = SuccessViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            } else {
                let alert = UIAlertController(title: "Thông báo", message: error?.localizedDescription ?? "", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Đóng", style: UIAlertAction.Style.cancel, handler: nil))
                self?.present(alert, animated: true)
            }
        })
    }
    
}
