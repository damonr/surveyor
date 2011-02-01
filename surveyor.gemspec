# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "surveyor"
  s.summary = "Insert Surveyor summary."
  s.description = "Insert Surveyor description."
  s.files = Dir["lib/**/*", "app/**/*", "config/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.version = "0.0.1"
  s.add_dependency "rails", "3.0.3"
  s.add_dependency 'haml'
  s.add_development_dependency "capybara", ">= 0.4.0"
  s.add_development_dependency "rspec-rails", ">= 2.0.0.beta"
  s.add_development_dependency "sqlite3-ruby"#, :require_as => "sqlite3"
  s.add_development_dependency 'ruby-debug19'#, :require_as => 'ruby-debug'
  s.add_development_dependency 'factory_girl'
end
