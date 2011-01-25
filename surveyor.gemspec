# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "surveyor"
  s.summary = "Insert Surveyor summary."
  s.description = "Insert Surveyor description."
  s.files = Dir["lib/**/*", "app/**/*", "config/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.version = "0.0.1"
end
