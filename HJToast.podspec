#
# Be sure to run `pod lib lint HJToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HJToast'
  s.version          = '0.1.0'
  s.summary          = 'A toast with accessory left and right views including title.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: A toast and a snack bar view which is highly customised to provide the accessory views (left and right). Generally used to show short messages over the view.
                       DESC

  s.homepage         = 'https://github.com/himanshujoshi47/HJToast'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Himanshu Joshi' => 'himanshujoshi47@gmail.com' }
  s.source           = { :git => 'https://github.com/himanshujoshi47/HJToast.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HJToast/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HJToast' => ['HJToast/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
