require 'rubygems'
require 'bundler'

Bundler.require

require File.join(File.dirname(__FILE__), 'endpoints.rb')
run Sinatra::Application
