Gem::Specification.new do |spec|
  spec.name          = "lita-corporate-bs-generator"
  spec.version       = "1.0.0"
  spec.authors       = ["Andrew Hayworth"]
  spec.email         = ["ahayworth@gmail.com"]
  spec.description   = %q{Lita handler to spout corporate bs}
  spec.summary       = %q{Lita handler to spout corporate bs}
  spec.homepage      = "https://github.com/ahayworth/lita-corporate-bs-generator"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 2.0"
  spec.add_runtime_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0"
end
