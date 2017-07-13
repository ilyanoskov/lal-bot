require './bot'
require './endpoints'

$stdout.sync = true

#initialize the app and create the API
run Rack::Cascade.new [API, Auth]
