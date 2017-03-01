require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Authentication strategy for connecting with the Dotloop API.
    class Dotloop < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, 'dotloop'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, :site => 'https://api-gateway.dotloop.com/public/v2/',
                              :authorize_url => 'https://auth.dotloop.com/oauth/authorize',
                              :token_url => 'https://auth.dotloop.com/oauth/token',
                              :auth_scheme => :basic_auth

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid {}

      # https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema#schema-10-and-later
      info {}

      extra {}
    end
  end
end
