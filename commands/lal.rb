require 'json'

class API < Sinatra::Base
    def lal
      lal_admin
      #check if user is admin
      # all lal-admin or lal-user respectively
    end

    def lal_admin
      admin_message = File.read('./commands/lal-admin.json')
      admin_message
    end

    def lal_user
      user_message = File.read('./commands/lal-user.json')
      user_message
    end
end
