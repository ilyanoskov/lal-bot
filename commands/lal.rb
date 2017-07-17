require 'json'
require 'video_info'
require 'mongoid'
require './db/objects/video'
require './commands/interactions/videos/videos'

class API < Sinatra::Base
  def lal(params)
    t = params[:text]
    t.strip! if t

    case t
    when /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/
      # accept video suggestion
      return accept_video_suggestion(t)
    when /^(http\:\/\/|https\:\/\/)?(www\.)?(vimeo\.com\/)([0-9]+)$/
      # accept video suggestion
      accept_video_suggestion(t)
    when 'poll'
      # start video polls
      poll
    when 'videos'
      get_unwatched_videos
    when 'help'
    # show help
    when nil || ''
      lal_menu
      end
  end

  def lal_menu
    l = File.read('./commands/lal-user.json')
    l
end

  def poll
    { hey: 'hey' }.to_json
  end

  def lal_admin
    admin_message = File.read('./commands/lal-admin.json')
    admin_message
  end

  def lal_user
    user_message = File.read('./commands/lal-user.json')
    user_message
  end

  def accept_video_suggestion(url)
    video = VideoInfo.new(url)
    details = {  
      title: video.title,
      description: video.description,
      url: url,
      thumbnail: video.thumbnail_small
    }
    
   if Video.where(details).exists?
      Video.update(details)
    else
      Video.create(details)
    end
    
    { text: 'Your video suggestion has been accepted!' }.to_json
  rescue
    { text: 'there was an error, try again' }.to_json
  end
end

