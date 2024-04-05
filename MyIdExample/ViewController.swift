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
            let alert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập số điện thoại", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Đóng", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        // phone success: 999123456789
        MobileIdApplication.shared.checkAvailable(phone: textField.text ?? "", completion: {[weak self] data, error in
            if error == nil && data?.available == true {
                MobileIdApplication.shared.login(phone: self?.textField.text ?? "",
                                                 scope: "openid ip:phone_verify ip:mobile_id")
            } else {
                self?.openOtpView(mess: error?.localizedDescription ?? "Phone is not support")
            }
        })
    }
    
    func openOtpView(mess: String?) {
        let alert = UIAlertController(title: "Thông báo", message: mess ?? "Xác thực không thành công", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Đóng", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Xác thực OTP", style: .default, handler: {[weak self] _ in
            let vc = OtpViewController()
            vc.phone = self?.textField.text ?? ""
            self?.navigationController?.pushViewController(vc, animated: true)
        }))
        present(alert, animated: true)
    }
    
    
}

extension ViewController: MobileIdApplicationDelegate {
    func verifyMobileIdDidFinish(_ data: MobileIdAuth?, _ error: NSError?) {
        if let accessToken = data?.accessToken {
            // Cách 1: Gửi accessToken lên server để verify ( Khuyến cáo )
            // Cách 2: Demo verify ở client
            MobileIdApplication.shared.getUserInfo(complition: {[weak self] data in
                if data?.phoneNumberVerified == true {
                    let vc = SuccessViewController()
                    self?.navigationController?.pushViewController(vc, animated: true)
                } else {
                    self?.openOtpView(mess: nil)
                }
            })
        } else {
            self.openOtpView(mess: error?.localizedDescription)
        }
    }
    
    
}
