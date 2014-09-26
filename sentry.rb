require 'bundler/setup'
require 'binding_of_caller'
require 'dotenv'
require 'raven'
Dotenv.load

Raven.configure do |config |
  config.dsn = ENV.fetch('SENTRY_DSN')
end


Raven.capture_message "My event",
  logger: 'logger',
  extra: {
    my_custom_variable: 'value'
  },
  tags: {
    environment: 'production'
  }

  begin
Raven.capture do
  require_relative 'custom_exception'
end
  rescue
  Raven.capture_exception(CustomException.new('some msg'), some: 'optons', extra: { stuff: 'stuff'})
  end
