# OmniAuth Dotloop

[![Gem Version](http://img.shields.io/gem/v/omniauth-dotloop.svg)][gem]
[![Build Status](http://img.shields.io/travis/dotloop/omniauth-dotloop.svg)][travis]
[![Code Climate](http://img.shields.io/codeclimate/github/dotloop/omniauth-dotloop.svg)][codeclimate]

[gem]: https://rubygems.org/gems/omniauth-dotloop
[travis]: http://travis-ci.org/dotloop/omniauth-dotloop
[codeclimate]: https://codeclimate.com/github/dotloop/omniauth-dotloop

Gem to authenticate applications to Dotloop via OAuth2.

# Background
Dotloop has a full API (docs at https://dotloop.github.io/public-api/) and uses to OAuth2 for authentication (https://dotloop.github.io/public-api/#authentication).

# Setup
To register your application to integrate with this API, please request access at http://info.dotloop.com/developers. Upon registration, we will issue you a client id and client secret which are prerequisites in order to use the API.

## Standard setup:

```ruby
  # Add to your initializers/omniauth.rb

  use OmniAuth::Builder do
    provider :dotloop, ENV['DOTLOOP_APP_ID'], ENV['DOTLOOP_APP_SECRET']
  end
```

## Setup with Devise:

```ruby
  # Add to your devise.rb

  config.omniauth :dotloop, ENV['DOTLOOP_APP_ID'], ENV['DOTLOOP_APP_SECRET']
```
