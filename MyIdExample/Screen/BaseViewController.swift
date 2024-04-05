//
//  BaseViewController.swift
//  MyIdExample
//
//  Created by congnguyen on 05/04/2024.
//

import UIKit

class BaseViewController: UIViewController {
    
    var loadingView: UIView = UIView()
    var loading: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect.zero)
    var background_acti: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDialogLoading()
    }
    
    func showLoading(isShow: Bool) {
        if isShow {
            background_acti.isHidden = false
            loadingView.isHidden = false
            loading.startAnimating()
        } else {
            background_acti.isHidden = true
            loadingView.isHidden = true
            loading.stopAnimating()
        }
    }
    
    func addDialogLoading() {
        loading.color = UIColor.yellow
        background_acti.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        background_acti.backgroundColor = UIColor.clear
        background_acti.clipsToBounds = true
        background_acti.isHidden = true
        background_acti.layer.cornerRadius = 10
        background_acti.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background_acti)
        NSLayoutConstraint.activate([NSLayoutConstraint(item: background_acti, attribute: .top,
                                                        relatedBy: .equal, toItem: self.view,
                                                        attribute: .top, multiplier: 1.0,
                                                        constant: 0),
                                     NSLayoutConstraint(item: background_acti, attribute: .leading,
                                                        relatedBy: .equal, toItem: self.view,
                                                        attribute: .leading, multiplier: 1.0,
                                                        constant: 0),
                                     NSLayoutConstraint(item: background_acti, attribute: .bottom,
                                                        relatedBy: .equal, toItem: self.view,
                                                        attribute: .bottom, multiplier: 1.0,
                                                        constant: 0),
                                     NSLayoutConstraint(item: background_acti, attribute: .trailing,
                                                        relatedBy: .equal, toItem: self.view,
                                                        attribute: .trailing, multiplier: 1.0,
                                                        constant: 0)])
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//        loadingView.backgroundColor = UIColor.gray
        loadingView.clipsToBounds = true
        loadingView.isHidden = true
        loadingView.layer.cornerRadius = 10
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        background_acti.addSubview(loadingView)
        NSLayoutConstraint.activate([NSLayoutConstraint(item: loadingView, attribute: .centerX,
                                                        relatedBy: .equal, toItem: self.view,
                                                        attribute: .centerX, multiplier: 1,
                                                        constant: 0),
                                     NSLayoutConstraint(item: loadingView, attribute: .centerY,
                                                        relatedBy: .equal, toItem: self.view,
                                                        attribute: .centerY, multiplier: 1,
                                                        constant: 0),
                                     NSLayoutConstraint(item: loadingView, attribute: .width,
                                                        relatedBy: .equal, toItem: nil,
                                                        attribute: .notAnAttribute, multiplier: 1.0,
                                                        constant: 40),
                                     NSLayoutConstraint(item: loadingView, attribute: .height,
                                                        relatedBy: .equal, toItem: nil,
                                                        attribute: .notAnAttribute, multiplier: 1.0,
                                                        constant: 40)])
        
        loading.translatesAutoresizingMaskIntoConstraints = false
        loadingView.addSubview(loading)
        NSLayoutConstraint.activate([NSLayoutConstraint(item: loading, attribute: .centerX,
                                                        relatedBy: .equal, toItem: loadingView,
                                                        attribute: .centerX, multiplier: 1,
                                                        constant: 0),
                                     NSLayoutConstraint(item: loading, attribute: .centerY,
                                                        relatedBy: .equal, toItem: loadingView,
                                                        attribute: .centerY, multiplier: 1,
                                                        constant: 0),
                                     NSLayoutConstraint(item: loading, attribute: .width,
                                                        relatedBy: .equal, toItem: nil,
                                                        attribute: .notAnAttribute, multiplier: 1.0,
                                                        constant: 40),
                                     NSLayoutConstraint(item: loading, attribute: .height,
                                                        relatedBy: .equal, toItem: nil,
                                                        attribute: .notAnAttribute, multiplier: 1.0,
                                                        constant: 40)])
    }
}
