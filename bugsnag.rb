require 'bundler/setup'
require 'binding_of_caller'
require 'dotenv'
require 'bugsnag'
Dotenv.load

Bugsnag.configure do |config |
  config.api_key = ENV.fetch('BUGSNAG_API_KEY')
end


Bugsnag.before_notify_callbacks << lambda {|notif|
  notif.add_tab(:user_info, {
    name: 'some user'
  })
}

class BugsnagException < StandardError
  include Bugsnag::MetaData

  def bugsnag_meta_data
    { wow: 'so much' }
  end
end

error = BugsnagException.new('custom text')
Bugsnag.notify(error, another: 'metadata')

at_exit do
  if $!
    Bugsnag.notify($!)
  end
end

require_relative 'custom_exception'
