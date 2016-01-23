Pod::Spec.new do |s|
  s.name = 'Ticker'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Logging library for Swift, funny by default'
  s.homepage = 'https://github.com/massimoksi/Ticker'
  s.authors = { 'Massimo Peri' => 'massimoperi@gmail.com' }
  s.source = { :git => 'https://github.com/massimoksi/Ticker.git', :tag => s.version }
  s.cocoapods_version = '>= 0.39'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/*.swift'

  s.requires_arc = true
end
