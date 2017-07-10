$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV['RACK_ENV'] ||= 'dev'

require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV']

require 'slack-ruby-bot-server'
require 'lal-bot'

LunchAndLearnBot::App.instance.prepare!

Thread.abort_on_exception = true

Thread.new do
  LunchAndLearnBot::Service.instance.start_from_database!
end

run Api::Middleware.instance
