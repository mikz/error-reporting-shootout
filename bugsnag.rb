require 'bundler/setup'
require 'dotenv'
require 'bugsnag'
Dotenv.load

Bugsnag.configure do |config |
  config.api_key = ENV.fetch('BUGSNAG_API_KEY')
end

require_relative 'custom_exception'

Bugsnag.notify CustomException.new('some msg')
