# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sc2replaystats/version"

Gem::Specification.new do |spec|
  spec.name          = "sc2replaystats"
  spec.version       = Sc2replaystats::VERSION
  spec.authors       = ["Joshua LeBlanc"]
  spec.email         = ["joshleblanc94@gmail.com"]

  spec.summary       = %q{Ruby interface for SC2ReplayStats api}
  spec.homepage      = "https://github.com/HorizonShadow/ruby-sc2replaystats"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'http://mygemserver.com'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_runtime_dependency 'rest-client'
end
