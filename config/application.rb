# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nisevi
  class Application < Rails::Application
    config.load_defaults 5.1

    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.log_level = :debug
    config.log_tags = %i[subdomain uuid]
    config.logger = ActiveSupport::TaggedLogging.new(logger)

    config.cache_store = :redis_store, ENV['CACHE_URL'], { namespace: 'nisevi::cache'}

    config.active_job.queue_adapter = :sidekiq
  end
end
