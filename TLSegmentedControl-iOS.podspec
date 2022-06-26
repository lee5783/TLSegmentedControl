Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "TLSegmentedControl-iOS"
  s.version      = "1.1.0"
  s.summary      = "A custom segmented control for iOS."
  s.description  = "A custom segmented control for iOS."
  s.homepage     = "https://github.com/lee5783/TLSegmentedControl"
  s.screenshots  = "https://github.com/lee5783/TLSegmentedControl/raw/master/demo.gif"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license      = { :type => "MIT", :file => "LICENSE" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author             = "lee5783"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "11.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/lee5783/TLSegmentedControl.git", :tag => "1.1.0" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "Classes", "Classes/**/*.{h,m,swift,xib}"
  s.pod_target_xcconfig = { "SWIFT_VERSION" => "5.0" }
  s.swift_versions = '5.0'
end
