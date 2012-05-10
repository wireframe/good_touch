# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "good_touch/version"

Gem::Specification.new do |s|
  s.name        = "good_touch"
  s.version     = GoodTouch::VERSION
  s.authors     = ["Ryan Sonnek"]
  s.email       = ["ryan@codecrate.com"]
  s.homepage    = ""
  s.summary     = %q{Update your timestamp attributes without invoking all ActiveRecord callbacks}
  s.description = %q{Fix default rails behavior that fires callbacks when touching records}

  s.rubyforge_project = "good_touch"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency(%q<activerecord>, ["< 3.1.0"])
  s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  s.add_development_dependency(%q<rake>, [">= 0.9.2.2"])
  s.add_development_dependency(%q<sqlite3>, ['= 1.3.4'])
end
