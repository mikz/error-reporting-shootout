require 'bundler/setup'
require 'binding_of_caller'
require 'dotenv'
require 'honeybadger'
Dotenv.load

Honeybadger.configure do |config |
  config.api_key = ENV.fetch('HONEYBADGER_API_KEY')
  config.send_local_variables = true
end

begin
  local_var = "abcd"
  local_var += 'efg'
require_relative 'custom_exception'
rescue
  Honeybadger.notify($!)
  raise
end
