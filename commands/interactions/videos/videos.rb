require './db/objects/video.rb'

class API < Sinatra::Base
    def get_unwatched_videos
        Video.find_by(watched: false).each do |vid|
            logger.info(vid)
        end
        videos
    end
end