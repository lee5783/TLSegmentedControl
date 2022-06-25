//
//  TLSegmentedDefaultView.swift
//  TLSegmentedControl
//
//  Created by Thu Le on 02/07/2021.
//

import Foundation
import UIKit

class TLSegmentedDefaultView: UIView, XibLoadable {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var vIndicator: UIView!
    
    init(name: String) {
        super.init(frame: .zero)
        initialize()
        lbName.text = name
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func setConfiguration(configuration: TLSegmentedControlConfiguration, selectedState isSelected: Bool) {
        if isSelected {
            backgroundColor = configuration.selectedBackgroundColor
            lbName.textColor = configuration.selectedTextColor
            lbName.font = configuration.selectedFont
            vIndicator.backgroundColor = configuration.selectedIndicatorColor
        } else {
            backgroundColor = configuration.normalBackgroundColor
            lbName.textColor = configuration.normalTextColor
            lbName.font = configuration.normalFont
            vIndicator.backgroundColor = configuration.normalIndicatorColor
        }
    }
    
    fileprivate func initialize() {
        _ = load(from: "TLSegmentedDefaultView", bundle: Bundle.segmentedControl)
    }
}
