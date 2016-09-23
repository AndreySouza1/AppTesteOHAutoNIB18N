source 'https://bitbucket.org/qranioios/specs.git'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.4'
use_frameworks!

target 'TesteOHAutoNIBi18n' do
  
  pod 'OHAutoNIBi18n', :path => '../OHAutoNIBi18n', :branch => 'AddKVO'
  
end

post_install do |installer|
    # Configuracoes do AutoNIB
    target = installer.pods_project.targets.find{|t| t.to_s == "OHAutoNIBi18n"}
    target.build_configurations.each do |config|
        s = config.build_settings['GCC_PREPROCESSOR_DEFINITIONS']
        s = [ '$(inherited)' ] if s == nil;
        s.push('OHAutoNIBi18n_OBSERVE_LOCALE');
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = s
    end
end