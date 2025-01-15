require_relative "lib/tty/cursor/version"

Gem::Specification.new do |spec|
  spec.name          = "tty-cursor"
  spec.version       = TTY::Cursor::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["piotr@piotrmurach.com"]
  spec.summary       = %q{Terminal cursor positioning, visibility and text manipulation.}
  spec.description   = %q{The purpose of this library is to help move the terminal cursor around and manipulate text by using intuitive method calls.}
  spec.homepage       = "https://ttytoolkit.org"
  spec.license       = "MIT"
  if spec.respond_to?(:metadata=)
    spec.metadata = {
      "allowed_push_host" => "https://rubygems.org",
      "bug_tracker_uri"   => "https://github.com/piotrmurach/tty-cursor/issues",
      "changelog_uri"     => "https://github.com/piotrmurach/tty-cursor/blob/master/CHANGELOG.md",
      "documentation_uri" => "https://www.rubydoc.info/gems/tty-cursor",
      "funding_uri"       => "https://github.com/sponsors/piotrmurach",
      "homepage_uri"      => spec.homepage,
      "rubygems_mfa_required" => "true",
      "source_code_uri"   => "https://github.com/piotrmurach/tty-cursor"
    }
  end
  spec.files         = Dir["lib/**/*", "sig/**/*", "README.md", "CHANGELOG.md", "LICENSE.txt"]
  spec.extra_rdoc_files = ["README.md", "CHANGELOG.md"]
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.0.0"

  spec.add_development_dependency "bundler", ">= 1.6"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "rake"
end
