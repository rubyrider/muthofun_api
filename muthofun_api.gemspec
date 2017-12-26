
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "muthofun_api/version"

Gem::Specification.new do |spec|
  spec.name          = "muthofun_api"
  spec.version       = MuthofunApi::VERSION
  spec.authors       = ["Irfan Ahmed"]
  spec.email         = ["irfandhk@gmail.com"]

  spec.summary       = %q{API for SMS Gateway for Muthofun (muthofun.com).}
  spec.description   = %q{API to integrate SMS Gateway of Muthofun (muthofun)}
  spec.homepage      = "https://github.com/rubyrider/muthofun_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
  spec.add_dependency 'activesupport', '~> 5.0'
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
