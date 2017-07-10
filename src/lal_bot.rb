require 'slack-ruby-bot'

class LunchAndLearnBot < SlackRubyBot::Bot
require_relative 'endpoints.rb'
    
  command 'start' do |client, data, match|
    client.say(text: "Let's start!", channel: data.channel)
  end

end
