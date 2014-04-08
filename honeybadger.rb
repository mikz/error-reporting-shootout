require 'bundler/setup'
require 'dotenv'
require 'honeybadger'
Dotenv.load

Honeybadger.configure do |config |
  config.api_key = ENV.fetch('HONEYBADGER_API_KEY')
end

require_relative 'custom_exception'

Honeybadger.notify(CustomException.new('some msg'))
