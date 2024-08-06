require_relative 'boot'

require 'csv' 
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Template
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # config.active_job.queue_adapter = :sidekiq 
    config.active_job.queue_adapter = Rails.env.production? ? :sidekiq : :async
    config.action_cable.mount_path = '/cable'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
	config.i18n.available_locales = [:en, :zh]
  config.i18n.default_locale = :zh
#  config.time_zone = 'Hong Kong'
#  config.active_record.default_timezone = 'Hong Kong'
  config.i18n.fallbacks = true
  end
end


