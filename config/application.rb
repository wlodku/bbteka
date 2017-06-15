require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)




# I18n.locale = :pl

module Bbteka
  class Application < Rails::Application
    config.i18n.default_locale = :pl
    # config.assets.paths << Rails.root.join("node_modules")

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
