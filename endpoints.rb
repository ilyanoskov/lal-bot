require 'sinatra'
require './commands/lal'
<<<<<<< HEAD
=======
require 'mongoid'
require './db/objects/user'
>>>>>>> interactions

#this class contains all endpoints and passes the processing onto
#respective functions

#We are going to use mongo with the endpoints, of course
Mongoid.load!('./db/mongoid.yml')

class API < Sinatra::Base
<<<<<<< HEAD

=======
>>>>>>> interactions
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
    logger.info(params.inspect)
    "interactions"
  end
  
  #menus
  post '/api/options' do
    "options"
  end

<<<<<<< HEAD
  #commands
=======
  #commands functionality
>>>>>>> interactions
  post '/api/lal' do
    content_type :json
    logger.info(params.inspect)
    lal
  end
end

