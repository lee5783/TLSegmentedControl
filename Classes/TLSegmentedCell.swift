//
//  TLSegmentedCell.swift
//  TLSegmentedControl
//
//  Created by Thu Le on 01/07/2021.
//

import Foundation
import UIKit

class TLSegmentedCell: UIView, XibLoadable {
    fileprivate var _name: String!
    fileprivate var btn: UIButton!
    fileprivate var _contentView: UIView!
    fileprivate var configuration: TLSegmentedControlConfiguration!
    fileprivate var btnTappedCompletion: ((_ cell: TLSegmentedCell) -> Void)?
    var contentView: UIView {
        return _contentView
    }
    
    var name: String {
        return _name
    }
    
    var isSelected: Bool = false {
        didSet {
            if let defaultView = _contentView as? TLSegmentedDefaultView {
                defaultView.setConfiguration(configuration: configuration, selectedState: isSelected)
            }
        }
    }

    init(name: String,
         configuration: TLSegmentedControlConfiguration,
         contentView: UIView?,
         completion: ((_ cell: TLSegmentedCell) -> Void)?
    ) {
        super.init(frame: .zero)
        self._name = name
        self.configuration = configuration
        if let v = contentView {
            self._contentView = v
        } else {
            self._contentView = {
                let v = TLSegmentedDefaultView(name: name)
                v.setConfiguration(configuration: configuration, selectedState: false)
                return v
            }()
        }
        btnTappedCompletion = completion
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func initialize() {
        addSubViewEqualBounds(view: _contentView)
        btn = UIButton()
        addSubViewEqualBounds(view: btn)
        btn.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
    }

    @objc fileprivate func btnTapped(_ sender: Any) {
        if isSelected {
            return
        }
        btnTappedCompletion?(self)
    }

    fileprivate func addSubViewEqualBounds(view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
