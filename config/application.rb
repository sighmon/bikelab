require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bikelab
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Allow all action_cable requests
    # config.action_cable.disable_request_forgery_protection = true

    # Allow all requests from me
    config.action_cable.allowed_request_origins = ['http://10.0.1.91:3000', 'http://localhost:3000']
  end
end
