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
            let alert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập số điện thoại", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Đóng", style: UIAlertAction.Style.cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        MobileIdApplication.shared.login(phone: textField.text ?? "",
                                         scope: "openid ip:phone_verify ip:mobile_id")
    }
    
    func openOtpView(mess: String?) {
        let alert = UIAlertController(title: "Thông báo", message: mess ?? "Xác thực không thành công", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Đóng", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Xác thực OTP", style: UIAlertAction.Style.default, handler: {[weak self] _ in
            let vc = OtpViewController()
            vc.phone = self?.textField.text ?? ""
            self?.navigationController?.pushViewController(vc, animated: true)
        }))
        present(alert, animated: true, completion: nil)
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
