require './db/objects/video.rb'

class API < Sinatra::Base
    def get_unwatched_videos
        response = {attachments: [
            text: "Here are the videos I've got in the archives!"
        ]}
        Video.where(watched: false).each do |vid|
            logger.info(vid)
            response[:attachments].push({text: video.title})
        end
        response.to_json
    end
end