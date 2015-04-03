require 'sinatra'

require './helpers'
require 'rspotify'
require 'launchy'
require 'watir-webdriver'
require 'philips_hue'

# require 'appscript'
# require 'osax'
require 'win32ole'

require './modules/spotify'
require './modules/itunes'
require './modules/spot_search'
require './modules/pulse'
require './modules/lights'

require 'numbers_in_words'
require 'numbers_in_words/duck_punch'

def process_query(command)
  p '=============================================================='
  p command.split(" ")
  p '=============================================================='

  p 'i hear commands'
  # HUE LIGHTS #
  if command.scan(/spotify/).length > 0
    p "I hear you say spotify"
    process_spotify(command)
  elsif command.scan(/itunes/).length > 0
    p "I hear you say itunes"
    process_itunes(command)
  elsif command.scan(/initiate | pulse/).length > 0
    p 'Welcome to Pulse Control'
    process_initiate(command)
  elsif command.scan(/abort/).length > 0
    p 'Welcome to Pulse Control'
    process_abort(command)
  elsif command.scan(/lights | light/).length > 0
    p 'Welcome to Hue Control'
    process_lights(command)
  end
end

get '/command' do
  process_query(params[:q])
end

get '/status' do
  status 200
end
