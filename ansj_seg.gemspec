# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ansj_seg/version'

Gem::Specification.new do |spec|
  spec.name          = "ansj_seg"
  spec.version       = AnsjSeg::VERSION
  spec.authors       = ["Howl王"]
  spec.email         = ["mimosa@aliyun.com"]
  spec.description   = %q{AnsjSeg for jRuby}
  spec.summary       = %q{ansj_seg for jRuby}
  spec.homepage      = "https://github.com/NLPchina/ansj_seg"
  spec.license       = "MIT"
  # important to get the jars installed
  spec.platform = 'java'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.requirements << 'jar org.nlpcn, nlp-lang, 1.7'
  spec.requirements << 'jar org.ansj, ansj_seg, 5.0.1'

  spec.add_runtime_dependency 'ruby-maven', '~> 3.3', '>= 3.3.12'
  spec.add_runtime_dependency 'jar-dependencies', '~> 0.3.5'
end