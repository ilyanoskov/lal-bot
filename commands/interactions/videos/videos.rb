require './db/objects/video.rb'

class API < Sinatra::Base
    def get_unwatched_videos
        videos = Video.find_by(watched: false)
        logger.info(videos)
        videos
    end
end