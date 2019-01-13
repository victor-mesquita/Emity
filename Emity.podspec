Pod::Spec.new do |s|
  s.name         = "Emity"
  s.version      = "0.0.3"
  s.summary      = "Simple event emitter for Swift"
  s.description  = <<-DESC
    Emity is a simple way to work with events in swift
  DESC
  s.homepage     = "https://github.com/SKOx0/Emity"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Victor Mesquita" => "skovhm@gmail.com" }
  s.ios.deployment_target = "9.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/SKOx0/Emity.git", :tag => 'v' +  s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.swift_version = "4.2"
end