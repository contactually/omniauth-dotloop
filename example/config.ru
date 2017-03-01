require 'bundler/setup'
require 'omniauth-dotloop'
require './app.rb'

use Rack::Session::Cookie, :secret => 'abc123'

use OmniAuth::Builder do
  provider :dotloop, ENV['DOTLOOP_APP_ID'], ENV['DOTLOOP_APP_SECRET']
end

run Sinatra::Application
