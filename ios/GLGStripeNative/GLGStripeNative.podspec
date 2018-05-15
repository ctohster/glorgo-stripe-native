Pod::Spec.new do |s|
  s.name         = "GLGStripeNative"
  s.version      = "0.1.1"
  s.summary      = "GLGStripeNative"
  s.description  = <<-DESC
                  GLGGlorgoStripeNative
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author       = { "author" => "Vignesh Rajasekaran" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/glorgo/glorgo-stripe-native.git", :tag => "master" }
  s.source_files  = "GLGStripeNative/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "Stripe"

end
