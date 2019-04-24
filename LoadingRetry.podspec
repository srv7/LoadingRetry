Pod::Spec.new do |s|
  s.name             = 'LoadingRetry'
  s.version          = '1.0.2'
  s.summary          = 'Loading and Retry'

  s.description      = <<-DESC
simple loading and retry tool
                       DESC

  s.homepage         = 'https://github.com/srv7/LoadingRetry'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'srv7' => 'liubo004@126.com' }
  s.source           = { :git => 'https://github.com/srv7/LoadingRetry.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  
  s.default_subspec = 'Core'
  s.subspec 'Core' do |core|
      core.source_files = 'LoadingRetry/Classes/Core/**/*'
      core.frameworks = 'UIKit'
  end
  
  s.subspec 'RxSwift' do |rx|
      rx.source_files = 'LoadingRetry/Classes/RxSupport/**/*'
      rx.dependency 'LoadingRetry/Core'
      rx.dependency 'RxCocoa'
  end
end
