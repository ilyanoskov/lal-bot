require './db/objects/video.rb'

class API < Sinatra::Base
    def get_unwatched_videos
        Video.where(watched: false).each do |vid|
            logger.info(vid)
        end
    end
end