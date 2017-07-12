require 'sinatra'
require 'json'

post '/api/interactions' do
  "Hello World"
end

post '/api/options' do
  "Hello World"
end

get '/api' do
  "HI"
end

post '/api/lal' do
  puts request.body.read.to_s
  content_type :json
  {
    "attachments": [
        {
            "text": "What do you want to do?",
            "fallback": "You are unable to choose a game",
            "callback_id": "wopr_game",
            "color": "#3AA3E3",
            "attachment_type": "default",
            "actions": [
                {
                    "name": "game",
                    "text": "Chess",
                    "type": "button",
                    "value": "chess"
                },
                {
                    "name": "game",
                    "text": "Falken's Maze",
                    "type": "button",
                    "value": "maze"
                },
                {
                    "name": "game",
                    "text": "Thermonuclear War",
                    "style": "danger",
                    "type": "button",
                    "value": "war",
                    "confirm": {
                        "title": "Are you sure?",
                        "text": "Wouldn't you prefer a good game of chess?",
                        "ok_text": "Yes",
                        "dismiss_text": "No"
                    }
                }
            ]
        }
    ]
  }.to_json
end
