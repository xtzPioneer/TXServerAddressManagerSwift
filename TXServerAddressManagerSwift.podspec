#
# Be sure to run `pod lib lint TXServerAddressManagerSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TXServerAddressManagerSwift'
  s.version          = '0.1.0'
  s.summary          = '服务器地址管理工具Swift版本.'
  s.description      = <<-DESC
  由TX所开发的服务器地址管理工具Swift版本.
                       DESC
  s.homepage         = 'https://github.com/xtzPioneer/TXServerAddressManagerSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '张雄' => 'xtz_pioneer@icloud.com' }
  s.source           = { :git => 'https://github.com/xtzPioneer/TXServerAddressManagerSwift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'
  s.swift_versions = '5.1', '5.2'
  s.source_files = 'TXServerAddressManagerSwift/Classes/**/*.swift'
end
