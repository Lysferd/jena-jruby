# -*- encoding: utf-8 -*-
lib = File::expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include? lib

require 'jena/version.rb'

# ensure we have the javalibs
update = File::expand_path('../bin/update_jena', __FILE__)
Kernel::load update, true

Gem::Specification.new do |s|
  s.name        = 'jena'
  s.version     = Jena::JENA_JRUBY_GEM_VERSION
  s.platform    = Gem::Platform.new('java')
  s.authors     = ['Ian Dickinson', 'Bruno Ferreira', 'Fábio Almeida']
  s.email       = %w( ian@epimorphics.com chalkos@chalkos.net phabio_almeida@hotmail.com )
  s.licenses    = 'Apache-2.0'
  s.homepage    = 'https://github.com/lysferd/jena'
  s.summary     = %q{JRuby wrapper for Apache Jena}
  s.description = %q{A simple packaging of Apache Jena for JRuby}

  s.files         = `git ls-files`.split(?\n).reject { |f| f.include? '/dev/' }
  s.files.concat Dir.glob('javalib/*.jar')
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split(?\n)
  s.executables   = `git ls-files -- bin/*`.split(?\n).map { |f| File::basename f }
  s.require_paths = %w( lib javalib )

  s.extra_rdoc_files = %w( README.md )
end

