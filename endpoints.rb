require 'sinatra'
require './commands/lal'
#this class contains all endpoints and passes the processing onto
#respective functions


class API < Sinatra::Base

  configure :production, :development do
     enable :logging
   end


  #Events API
  post '/api/events' do
    logger.info(params.inspect)
    payload = JSON.parse(request.body.read).symbolize_keys unless params[:path]
    payload.challenge

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

