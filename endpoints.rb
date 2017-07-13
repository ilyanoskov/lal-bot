require 'sinatra/base'
require './commands/lal'
#this class contains all endpoints and passes the processing onto
#respective functions

class API < Sinatra::Base

  #Events API
  post '/api/events' do
    params.challenge
  end
  
  #interactive messages and menus
  post '/api/interactions' do
    "interactions"
  end

  post '/api/options' do
    "options"
  end

  # commands
  post '/api/lal' do
    content_type :json
    lal
  end
end

