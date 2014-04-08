require 'bundler/setup'
require 'dotenv'
require 'raven'
Dotenv.load

Raven.configure do |config |
  config.dsn = ENV.fetch('SENTRY_DSN')
end

require_relative 'custom_exception'

Raven.capture_exception(CustomException.new('some msg'))
