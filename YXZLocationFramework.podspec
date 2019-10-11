#
#  Be sure to run `pod spec lint WHMemberLogin.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "WHMemberLogin"
  s.version      = "1.0.6"
  s.summary      = "WHMemberLogin for user login."
  s.license          = {:type => "MIT", :file => "LICENSE"}
  s.author           = { "benpu.fu" => "benpu.fu@bestwehotel.com" }
   s.module_name = 'WHMemberLogin'
  s.homepage     = "http://git.ejinjiang.com:10080/Mobile/WHMemberLogin"
  s.source       = { :git => "http://git.ejinjiang.com:10080/Mobile/WHMemberLogin.git", :tag => s.version.to_s}

  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.frameworks = 'UIKit', 'Foundation'
  s.public_header_files = 'WHMemberLoginSDK/Core/WHLoginStateManager.h'


  s.subspec 'Core' do |core|
    core.source_files = "WHMemberLoginSDK/Core/**/*.{h,m}"
    core.vendored_libraries = 'WHMemberLoginSDK/Core/Manager/FMDeviceManager/*.a'
    core.ios.libraries =  'resolv.9'

  end

  s.subspec 'Botao' do |botao|
    botao.dependency 'WHMemberLogin/Core'
    botao.source_files = "WHMemberLoginSDK/BTJJLogin/**/*.{h,m}"
    botao.resource = "WHMemberLoginSDK/Bundle/WHMemberLoginBotao.bundle"
  end

  s.subspec 'WeTrip' do |wetrip|
    wetrip.dependency 'WHMemberLogin/Core'
    wetrip.source_files = "WHMemberLoginSDK/WeTripLogin/**/*.{h,m}"
    wetrip.resource = "WHMemberLoginSDK/Bundle/WeTripLogin.bundle"
  end




s.dependency 'Masonry'
s.dependency 'WHCommonViewComponents'
s.dependency 'WHCommonUtilsComponents'
s.dependency 'WHNetworkComponent'
s.dependency 'WHComponentCenter'
s.dependency 'CardTypeActionSheetView'
s.dependency 'WHNationalCode'



end
