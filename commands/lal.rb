require 'json'
require './db/objects/video'
require 'video_info'

class API < Sinatra::Base
    def lal(params)
      t = params[:text]
    case t 
      when t.match(/^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/)
        # accept video suggestion
        accept_video_suggestion(t)
      when t.match(/^(http\:\/\/|https\:\/\/)?(www\.)?(vimeo\.com\/)([0-9]+)$/)
        # accept video suggestion
        accept_video_suggestion(t)
      when (t.strip == "poll")
        # start video polls
      else
      # menu for admin or non-admin user
      end
    end

    def lal_menu

    end

    def lal_admin
      admin_message = File.read('./commands/lal-admin.json')
      admin_message
    end

    def lal_user
      user_message = File.read('./commands/lal-user.json')
      user_message
    end

    private 
    def accept_video_suggestion(url)
        video = VideoInfo.new(url)
        Video.create({
          title: video.title,
          votes: 0,
          description: video.description,
          watched: false
        })

        {text: "Your video suggestion has been accepted!"}.to_json
    end
end
