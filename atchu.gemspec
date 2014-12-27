Gem::Specification.new do |s|
  s.name = 'atchu'
  s.version = '0.0.6'
  s.date = '2014-12-27'
  s.summary = 'Reverse engineer DB with composite keys to Active Records'
  s.description = "Reverse engineer DB with composite keys to Active Records"
  s.authors = ["Deepak"]       
  s.files = Dir['README.md', 'lib/**/*']
  s.test_files = Dir['spec/**/*'] 
  s.homepage = 'https://github.com/paramadeep/atchu'
  s.license = 'MIT'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rubygems-tasks'
  s.add_development_dependency 'simplecov'

  s.add_dependency 'activerecord'
  s.add_dependency 'pg'
  s.add_dependency "erubis"

end
