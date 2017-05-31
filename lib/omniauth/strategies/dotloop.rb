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
      uid { raw_info['data']['id'] }

      # https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema#schema-10-and-later
      info do
        prune!(
          :email      => raw_info['data']['email'],
          :first_name => raw_info['data']['first_name'],
          :last_name  => raw_info['data']['last_name']
        )
      end

      extra do
        hash = {}
        hash['raw_info'] = raw_info
        prune! hash
      end

      def raw_info
        @raw_info ||= access_token.get('https://api-gateway.dotloop.com/public/v2/account').parsed || {}
      end

      protected

      def build_access_token
        options.token_params[:headers] = { 'Authorization' => basic_auth_header }
        super
      end

      def basic_auth_header
        "Basic #{Base64.urlsafe_encode64("#{options[:client_id]}:#{options[:client_secret]}")}"
      end

      private

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end
