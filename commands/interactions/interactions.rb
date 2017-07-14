require './videos/suggest_videos.rb'

class API < Sinatra::Base
    def interact(text) 
       args = text.split(' ')
       switch args[0]
    when 'suggest'
        accept_sugestion(args[1])
    else 
        'error'
    end
end
