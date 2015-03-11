Pod::Spec.new do |s|
  s.name         = "JailbrokenDetector.podspec"
  s.version      = "0.1.0"
  s.summary      = "Detect if your iOS device is jailbroken."
  s.homepage     = "https://github.com/0dayZh/JailbrokenDetector"
  s.license      = 'MIT'
  s.author       = { "0dayZh" => "0day.zh@gmail.com" }
  s.ios.deployment_target = '5.0'
  s.source       = { :git => "https://github.com/0dayZh/JailbrokenDetector.git", :tag => s.version }

  s.public_header_files = 'JailbrokenDetector/*.h'
  s.source_files = 'JailbrokenDetector/*.{h,m}'
  s.requires_arc = true
  s.framework    = 'UIKit'
end
