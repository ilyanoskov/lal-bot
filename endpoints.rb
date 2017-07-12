require 'sinatra'

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
  puts request.body
  "thanks"
end
