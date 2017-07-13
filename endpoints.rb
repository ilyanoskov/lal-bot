require 'sinatra'
require './commands/lal'
require 'mongoid'

#this class contains all endpoints and passes the processing onto
#respective functions

#We are going to use mongo with the endpoints, of course
Mongoid.load!('./db/mongoid.yml')

class API < Sinatra::Base
  configure :production, :development do
    enable :logging
  end

  #Events API
  post '/api/events' do
    payload = JSON.parse(request.body.read).symbolize_keys unless params[:path]
    payload[:challenge]
  end
  
  #interactive messages
  post '/api/interactions' do
    "interactions"
  end
  
  #menus
  post '/api/options' do
    "options"
  end

  #commands functionality
  post '/api/lal' do
    content_type :json
    logger.info(params.inspect)
    lal
  end
end

