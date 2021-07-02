//
//  TLSegmentedControl.swift
//  TLSegmentedControl
//
//  Created by lee5783 on 07/01/21.
//  Copyright © 2021 lee5783. All rights reserved.
//

import UIKit

@objc public protocol TLSegmentedControlDelegate: NSObjectProtocol {
    //required
    func segmentedControl(segmentedControl: TLSegmentedControl, itemDidSelect name: String, atIndex index: Int)
    //optional
    @objc optional func segmentedControl(segmentedControl: TLSegmentedControl, viewForItem name: String) -> UIView?
    @objc optional func segmentedControl(segmentedControl: TLSegmentedControl, updateView view: UIView, withSelectedState isSelected: Bool)
}

protocol TLSegmentedControlConfiguration {
    var normalBackgroundColor: UIColor { get }
    var selectedBackgroundColor: UIColor { get }
    var normalTextColor: UIColor { get }
    var selectedTextColor: UIColor { get }
    var normalFont: UIFont { get }
    var selectedFont: UIFont { get }
    var normalIndicatorColor: UIColor { get }
    var selectedIndicatorColor: UIColor { get }
}

public class TLSegmentedControl: UIControl, TLSegmentedControlConfiguration {
    
    //MARK: - TLSegmentedControlConfiguration
    public var normalBackgroundColor: UIColor = .clear
    public var selectedBackgroundColor: UIColor = .systemBlue
    public var normalTextColor: UIColor = .systemBlue
    public var selectedTextColor: UIColor = .white
    public var normalFont: UIFont = UIFont.systemFont(ofSize: 16)
    public var selectedFont: UIFont = UIFont.boldSystemFont(ofSize: 16)
    public var normalIndicatorColor: UIColor = .clear
    public var selectedIndicatorColor: UIColor = .systemGreen
    
    public var selectedIndex: Int = NSNotFound {
        didSet {
            guard selectedIndex != NSNotFound,
                  stackView != nil,
                  selectedIndex >= 0,
                  selectedIndex < stackView.arrangedSubviews.count else {
                return
            }
            if oldValue != NSNotFound,
               let oldCell = stackView.arrangedSubviews[oldValue] as? TLSegmentedCell {
                oldCell.isSelected = false
                delegate?.segmentedControl?(segmentedControl: self, updateView: oldCell.contentView, withSelectedState: false)
            }
            
            if let newCell = stackView.arrangedSubviews[selectedIndex] as? TLSegmentedCell {
                newCell.isSelected = true
                delegate?.segmentedControl?(segmentedControl: self, updateView: newCell.contentView, withSelectedState: true)
            }
        }
    }
    
    public weak var delegate: TLSegmentedControlDelegate?
    
    fileprivate var stackView: UIStackView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    fileprivate func initialize() {
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    public func append(segmentName: String) {
        stackView.addArrangedSubview(
            {
                let cell = TLSegmentedCell(name: segmentName,
                                           configuration: self,
                                           contentView: delegate?.segmentedControl?(segmentedControl: self, viewForItem: segmentName)) {[weak self] selectedCell in
                    guard let sSelf = self else { return }
                    if let index = sSelf.stackView.arrangedSubviews.firstIndex(of: selectedCell) {
                        sSelf.selectedIndex = index
                        sSelf.delegate?.segmentedControl(segmentedControl: sSelf, itemDidSelect: selectedCell.name, atIndex: index)
                    }
                }
                return cell
            }()
        )
        if selectedIndex == NSNotFound {
            selectedIndex = 0
        }
    }
    
    public func append(segmentNames: [String]) {
        segmentNames.forEach { append(segmentName: $0) }
    }
}
