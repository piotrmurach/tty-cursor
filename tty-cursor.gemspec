lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tty/cursor/version"

Gem::Specification.new do |spec|
  spec.name          = "tty-cursor"
  spec.version       = TTY::Cursor::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["me@piotrmurach.com"]
  spec.summary       = %q{Terminal cursor positioning, visibility and text manipulation.}
  spec.description   = %q{The purpose of this library is to help move the terminal cursor around and manipulate text by using intuitive method calls.}
  spec.homepage       = "http://piotrmurach.github.io/tty/"
  spec.license       = "MIT"
  if spec.respond_to?(:metadata=)
    spec.metadata = {
      "allowed_push_host" => "https://rubygems.org",
      "bug_tracker_uri"   => "https://github.com/piotrmurach/tty-cursor/issues",
      "changelog_uri"     => "https://github.com/piotrmurach/tty-cursor/blob/master/CHANGELOG.md",
      "documentation_uri" => "https://www.rubydoc.info/gems/tty-cursor",
      "homepage_uri"      => spec.homepage,
      "source_code_uri"   => "https://github.com/piotrmurach/tty-cursor"
    }
  end
  spec.files         = Dir["lib/**/*.rb", "tty-cursor.gemspec"]
  spec.files        += Dir["README.md", "CHANGELOG.md", "LICENSE.txt"]
  spec.executables   = []
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.0.0"

  spec.add_development_dependency "bundler", ">= 1.6"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "rake"
end
