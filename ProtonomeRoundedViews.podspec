#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name                    = "ProtonomeRoundedViews"
  s.version                 = "1.2.0"
  s.summary                 = "ProtonomeRoundedViews is a collection of IBDesignable-compatible views with rounded corners."
  s.homepage                = "https://github.com/dclelland/Bezzy"
  s.license                 = { :type => 'MIT' }
  s.author                  = { "Daniel Clelland" => "daniel.clelland@gmail.com" }
  s.source                  = { :git => "https://github.com/dclelland/ProtonomeRoundedViews.git", :tag => "1.2.0" }
  s.platform                = :ios, '8.0'
  s.swift_version           = '5.0'
  s.ios.deployment_target   = '8.0'
  s.ios.source_files        = 'Classes/**/*.swift'
  s.requires_arc            = true
end
