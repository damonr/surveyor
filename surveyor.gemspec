# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = %q{surveyor}
  s.version = "0.19.0"
  s.authors = ["Brian Chamberlain", "Mark Yoon"]
  s.date = %q{2011-01-31}
  s.email = %q{yoon@northwestern.edu}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.homepage = %q{http://github.com/breakpointer/surveyor}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A rails (gem) plugin to enable surveys in your application}
  
  s.files = Dir["lib/**/*", "app/**/*", "config/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.add_dependency "rails", "3.0.3"
  s.add_dependency 'haml'
  s.add_dependency 'formtastic', ">= 1.2.3"
  s.add_dependency 'yard'
  s.add_development_dependency "capybara", ">= 0.4.0"
  s.add_development_dependency "rspec-rails", ">= 2.0.0.beta"
  s.add_development_dependency "sqlite3-ruby"#, :require_as => "sqlite3"
  s.add_development_dependency 'ruby-debug19'#, :require_as => 'ruby-debug'
  s.add_development_dependency 'factory_girl'
end

