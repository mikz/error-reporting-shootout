require 'bundler/setup'
require 'dotenv'
require 'rollbar'
Dotenv.load

Rollbar.configure do |config |
  config.access_token = ENV.fetch('ROLLBAR_ACCESS_TOKEN')
end

require_relative 'custom_exception'

Rollbar.report_exception(CustomException.new('some msg'))
