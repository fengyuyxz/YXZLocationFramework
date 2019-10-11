#
#  Be sure to run `pod spec lint WHMemberLogin.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "YXZLocationFramework"
  s.version      = "0.0.1"
  s.summary      = "YXZLocationFramework for user login."
  s.license          = {:type => "MIT", :file => "LICENSE"}
  s.author           = { "benpu.fu" => "benpu.fu@bestwehotel.com" }
   s.module_name = 'WHMemberLogin'
  s.homepage     = "https://github.com/xuezhouyan"
  s.source       = { :git => "https://github.com/xuezhouyan/YXZLocationFramework.git", :tag => s.version.to_s}

  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.frameworks = 'UIKit', 'Foundation'
  # s.public_header_files = 'WHMemberLoginSDK/Core/WHLoginStateManager.h'


  s.subspec 'Core' do |core|
    core.source_files = "YXZLocationFramework/core/manager/*.{h,m}"
    
  end

  s.subspec 'BaiDuLocation' do |baiDuLocation|
    baiDuLocation.dependency 'YXZLocationFramework/Core'
    baiDuLocation.source_files = "YXZLocationFramework/core/BMExample/*.{h,m}"
    baiDuLocation.dependency 'BMKLocationKit'
  end

  s.subspec 'GaoDeLocation' do |gaodeLocation|
    gaodeLocation.dependency 'YXZLocationFramework/Core'
    gaodeLocation.source_files = "YXZLocationFramework/core/AMExample/*.{h,m}"
    gaodeLocation.dependency 'AMapLocation'
  end






end
