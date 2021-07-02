//
//  Extensions.swift
//  TLSegmentedControl
//
//  Created by Thu Le on 01/07/2021.
//

import Foundation

protocol XibLoadable {
    func load(from xibName: String, bundle: Bundle?) -> Bool
    func add(to view: UIView)
}

extension XibLoadable where Self: UIView {
    func load(from xibName: String, bundle: Bundle? = nil) -> Bool {
        let selectedBundle = bundle ?? Bundle.main
        guard let xibContents = selectedBundle.loadNibNamed(xibName, owner: self, options: nil),
            let view = xibContents.first as? UIView
            else { return false }

        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        return true
    }
    
    func add(to view: UIView) {
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

public extension Bundle {
    static var segmentedControl: Bundle {
        return Bundle(for: TLSegmentedControl.self)
    }
}
