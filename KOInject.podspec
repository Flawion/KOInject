Pod::Spec.new do |s|
  s.name = 'KOInject'
  s.version = '1.0.2'

  s.summary = 'Simple and lightweight IoC container for dependency injection in Swift with iOS/macOS/watchOS/tvOS'
  s.description = 'Simple and lightweight IoC container, works on the register / resolve / dispose pattern with scopes of use and multiple arguments. It also supports lazy and isolated resolving.'
  s.homepage = 'https://github.com/Flawion/KOInject'

  s.license = 'MIT'
  s.author = 'Kuba Ostrowski'

  s.ios.deployment_target = '11.0'
  s.macos.deployment_target = '10.13'
  s.tvos.deployment_target = '11.0'
  s.watchos.deployment_target = '4.0'

  s.source = { :git => 'https://github.com/Flawion/KOInject.git', :tag => s.version }

  s.source_files = 'Sources/**/*.swift'

  s.requires_arc = true
  s.swift_version = ['5.1', '5.2', '5.3']
end
