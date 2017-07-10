Dir[File.expand_path('../config/initializers', __FILE__) + '/**/*.rb'].each do |file|
  require file
end

Mongoid.load! File.expand_path('../config/mongoid.yml', __FILE__), ENV['RACK_ENV']

#get the token
ENV['SLACK_API_TOKEN'] = $slack_token

require 'lal-bot/api'
require 'lal-bot/app'
require 'lal-bot/server'
require 'lal-bot/service'
