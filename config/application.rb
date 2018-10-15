require_relative 'boot'
require 'rails/all'
# require 'rspotify'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
# RSpotify::authenticate("<fdf310728fcd457d89ea528ba2140c5d>", "<d66e6f26642f4ef3bb06759fa2e5d72c>")
module Musicapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
  end
end
