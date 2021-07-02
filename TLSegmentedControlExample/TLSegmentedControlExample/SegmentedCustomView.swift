//
//  SegmentedCustomView.swift
//  TLSegmentedControlExample
//
//  Created by Thu Le on 02/07/2021.
//  Copyright © 2021 lee5783. All rights reserved.
//

import Foundation
import UIKit

class SegmentedCustomView: UIView {
    @IBOutlet weak var vPill: UIView! {
        didSet {
            vPill.layer.cornerRadius = 15
            vPill.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var vIndiactor: UIView!
    
    var isSelected: Bool = false {
        didSet {
            if isSelected {
                vPill.backgroundColor = .systemBlue
                vIndiactor.backgroundColor = .systemBlue
                lbName.textColor = .white
            } else {
                vPill.backgroundColor = .clear
                vIndiactor.backgroundColor = .clear
                lbName.textColor = .black
            }
        }
    }
    
    init(name: String) {
        super.init(frame: .zero)
        initialize()
        self.lbName.text = name
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private func initialize() {
        guard let xibContents = Bundle.main.loadNibNamed("SegmentedCustomView", owner: self, options: nil),
            let view = xibContents.first as? UIView
            else { return }
        
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
