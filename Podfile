platform :ios, '9.0'

target 'yeFikir_Debdabe' do

  use_frameworks!
  pod 'Firebase/Core'
  pod 'Firebase/Messaging'
  pod 'Firebase/AdMob'
  pod 'Fabric', '~> 1.9.0'
  pod 'Crashlytics', '~> 3.12.0'
  post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
        end
    end
end


# Pods for BestQuotes
target 'yeFikir_DebdabeTests' do
    inherit! :search_paths
    pod 'Firebase'
    # Pods for testing
end

end
