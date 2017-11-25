require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Ekomalt
  class Application < Rails::Application
    config.load_defaults 5.1

    config.i18n.default_locale = :uk
  end
end





