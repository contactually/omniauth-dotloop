require File.expand_path('../lib/omniauth-dotloop/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Contactually', 'Mwaki Harri Magotswi']
  gem.email         = ['api@contactually.com', 'magotswi@gmail.com']
  gem.description   = 'OmniAuth OAuth2 strategy for Dotloop.'
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/contactually/omniauth-dotloop'
  gem.licenses      = %w[MIT]

  gem.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-dotloop'
  gem.require_paths = %w[lib]
  gem.version       = OmniAuth::Dotloop::VERSION

  # Lock at 1.3.x due to https://github.com/intridea/omniauth-oauth2/issues/81
  gem.add_dependency 'omniauth-oauth2', '~> 1.3.1'

  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rubocop'
end
