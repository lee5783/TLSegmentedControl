//
//  ViewController.swift
//  TLMonthYearPickerExample
//
//  Created by Thu Le on 12/22/16.
//  Copyright © 2016 lee5783. All rights reserved.
//

import UIKit
import TLSegmentedControl_iOS
import Toaster

class ViewController: UITableViewController {
    @IBOutlet weak var defaultSegmentedControl: TLSegmentedControl! {
        didSet {
            defaultSegmentedControl.delegate = self
            defaultSegmentedControl.append(segmentName: "One")
            defaultSegmentedControl.append(segmentName: "Two")
            defaultSegmentedControl.append(segmentName: "Three")
        }
    }
    
    @IBOutlet weak var customAppearanceSegmentedControl: TLSegmentedControl! {
        didSet {
            customAppearanceSegmentedControl.delegate = self
            customAppearanceSegmentedControl.selectedTextColor = .red
            customAppearanceSegmentedControl.selectedIndicatorColor = .clear
            customAppearanceSegmentedControl.normalBackgroundColor = .lightGray.withAlphaComponent(0.5)
            customAppearanceSegmentedControl.append(segmentName: "One")
            customAppearanceSegmentedControl.append(segmentName: "Two")
            customAppearanceSegmentedControl.append(segmentName: "Three")
        }
    }
    
    @IBOutlet weak var customViewSegmentedControl: TLSegmentedControl! {
        didSet {
            customViewSegmentedControl.delegate = self
            customViewSegmentedControl.append(segmentName: "One")
            customViewSegmentedControl.append(segmentName: "Two")
            customViewSegmentedControl.append(segmentName: "Three")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
    }
}

extension ViewController: TLSegmentedControlDelegate {
    func segmentedControl(segmentedControl: TLSegmentedControl, itemDidSelect name: String, atIndex index: Int) {
        Toast(text: "Select item: \(name) at index: \(index) ").show()
    }
    
    func segmentedControl(segmentedControl: TLSegmentedControl, viewForItem name: String) -> UIView? {
        if segmentedControl == customViewSegmentedControl {
        return SegmentedCustomView(name: name)
        }
        return nil
    }
    
    func segmentedControl(segmentedControl: TLSegmentedControl, updateView view: UIView, withSelectedState isSelected: Bool) {
        if segmentedControl == customViewSegmentedControl {
            if let v = view as? SegmentedCustomView {
                v.isSelected = isSelected
            }
        }
    }
}
