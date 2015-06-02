$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_dump2_s3/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_dump2_s3"
  s.version     = RailsDump2S3::VERSION
  s.authors     = ["Yuto Ogi"]
  s.email       = ["jacoyutorius@gmail.com"]
  s.homepage    = ""
  s.summary     = "Dump rails db to YAML format, and submit to AmazonS3"
  s.description = "Dump rails db to YAML format, and submit to AmazonS3"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "yaml_db"
  s.add_dependency "aws-sdk",'~> 1.61.0'
end
