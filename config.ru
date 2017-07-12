require 'rubygems'
require 'bundler'

Bundler.require
$stdout.sync = true

require File.join(File.dirname(__FILE__), 'endpoints.rb')
run Sinatra::Application
