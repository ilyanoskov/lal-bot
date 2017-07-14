require './db/objects/video'
require 'video_info'

class API < Sinatra::Base
    def accept_suggestion(url)
        video = VideoInfo.new(url)
        Video.create({
            title: video.title,
            votes: 0,
            description: video.description,
            watched: false
        })
    end

end
