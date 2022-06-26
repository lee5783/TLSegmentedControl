# TLSegmentedControl
A custom segmented control for iOS.</br>

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/TLSegmentedControl-iOS.svg?style=flat-square)](https://img.shields.io/cocoapods/v/TLSegmentedControl-iOS.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)

<p align="center">
 <img src="https://github.com/lee5783/TLSegmentedControl/raw/master/demo.gif" alt="TLSegmentedControl"/>
</p>

## How it works

```swift
    segmentedControl.delegate = self
    segmentedControl.normalBackgroundColor = .clear
    segmentedControl.selectedBackgroundColor = .systemBlue
    segmentedControl.normalTextColor = .systemBlue
    segmentedControl.selectedTextColor = .white
    segmentedControl.normalIndicatorColor = .clear
    segmentedControl.selectedIndicatorColor = .white
    segmentedControl.normalBackgroundColor = .lightGray.withAlphaComponent(0.5)
    segmentedControl.append(segmentName: "One")
    segmentedControl.append(segmentName: "Two")
    segmentedControl.append(segmentName: "Three")

    //TLSegmentedControlDelegate
    //required
    func segmentedControl(segmentedControl: TLSegmentedControl, itemDidSelect name: String, atIndex index: Int)
    //optional, implement below functions when using custom view
    @objc optional func segmentedControl(segmentedControl: TLSegmentedControl, viewForItem name: String) -> UIView?
    @objc optional func segmentedControl(segmentedControl: TLSegmentedControl, updateView view: UIView, withSelectedState isSelected: Bool)
```

## Add to your project

### Installation with CocoaPods
```ruby
    pod 'TLSegmentedControl-iOS'
```

### Installation with Carthage
```ruby
    github "lee5783/TLSegmentedControl"
```

### Installation with Swift Package Manager
```ruby
    dependencies: [
        .package(url: "https://github.com/lee5783/TLSegmentedControl.git", .upToNextMajor(from: "1.1.0"))
    ]
```
## License
Usage is provided under the [MIT License](http://opensource.org/licenses/mit-license.php). See LICENSE for the full details.
