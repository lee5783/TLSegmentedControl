# TLSegmentedControl
A custom segmented control for iOS.</br>

<p align="center">
 <img src="https://github.com/lee5783/TLSegmentedControl/raw/master/demo.gif" alt="TLMonthYearPicker"/>
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
    pod 'TLSegmentedControl'
```
## License
Usage is provided under the [MIT License](http://opensource.org/licenses/mit-license.php). See LICENSE for the full details.
