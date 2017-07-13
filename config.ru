$stdout.sync = true

require './bot'
require './endpoints'

#initialize the app and create the API
run Rack::Cascade.new [API, Auth]
