//
//  XibView.swift
//  MyIdLib
//
//  Created by congnguyen on 26/02/2024.
//

import UIKit

extension UINib {
    func instantiate(owner: Any? = nil) -> Any? {
        return self.instantiate(withOwner: owner, options: nil).first
    }
}

protocol NibLoadable: AnyObject {}
extension NibLoadable where Self: UIView {

    static var nib: UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: "\(self)", bundle: bundle)
    }

    func loadFromNib() -> UIView {
        return type(of: self).nib.instantiate(owner: self) as! UIView // swiftlint:disable:this force_cast
    }
    
    @discardableResult
    func fromNib() -> UIView? {
        let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as! UIView
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.edges(to: self)
        return contentView
    }
}

@IBDesignable
class XibView: UIView, NibLoadable {

    @IBOutlet private weak var view: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
        setupView()
    }

    private func nibSetup() {
        backgroundColor = .clear

        view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true

        addSubview(view)
    }
    
    func setupView() {
        
    }
}

class XibTableViewCell: UITableViewCell, NibLoadable {}

class XibCollectionViewCell: UICollectionViewCell, NibLoadable {}
