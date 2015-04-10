require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'sidekiq/web'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# http://easyramble.com/escape-like-on-rails-active-record.html
module ActiveRecord
  class Base
    def self.escape_like(string)
      string.gsub(/[\\%_]/){ |m| "\\#{m}" }
    end
  end
end

module Shoko
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.default_locale = :ja

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.generators.template_engine = :slim
    config.generators.test_framework  = :rspec
    config.generators.stylesheets = false
    config.generators.javascripts = false
    config.generators.helper      = false

    config.middleware.delete 'Rack::Sendfile'
    config.active_job.queue_adapter = :sidekiq

    config.git_revision = `git log --abbrev-commit --pretty=oneline | head -1 | cut -d' ' -f1`
  end
end
