require File.expand_path("../lib/billing/version", __FILE__)

# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "billing"
  s.version = Billing::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = ["Jason Rankin"]
  s.email = ["jrankin@batchblue.com"]
  s.summary = "Insert Billing summary."
  s.description = "Insert Billing description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"

  s.add_dependency "activesupport" , "~> 3.0.7"
  s.add_dependency "rails"         , "~> 3.0.7"
  s.add_dependency "thor"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rb-fsevent"
  s.add_development_dependency "growl_notify"
 
  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
  
end
