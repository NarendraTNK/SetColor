
Pod::Spec.new do |spec|

  spec.name          = "SetColor"
  spec.version       = "1.0.7"
  spec.summary       = "SetColor pod use for set color to view"
  spec.description   = <<-DESC
                      Lightwidth and small size easy to integrated
                   DESC
  spec.homepage      = "http://appcoda.com"
  spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Narendra" => "narendratnk11@gmail.com" }
  spec.platform      = :ios, "12.0"
  spec.source        = { :git => "https://github.com/NarendraTNK/SetColor.git", :tag => "#{spec.version}" }
  spec.source_files  = "SetColor/Source/*.{swift}"
  spec.resources = "SetColor/**/*.{storyboard,lproj}"
  spec.swift_version = "5.0"

end
