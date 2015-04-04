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
require './modules/pulse'
require './modules/lights'
require './modules/mode'
require './modules/twitch'


require 'open-uri'
require 'json'



require 'numbers_in_words'
require 'numbers_in_words/duck_punch'

hue = PhilipsHue::Bridge.new("my light app", "10.0.1.8")
RSpotify.authenticate("edc6b110ccfb40f68390945a1ed88b73", "c355cfe898f8471e84966da16772be1e")

def process_query(command, hue)


  p '=============================================================='
  p command.split(" ")
  p '=============================================================='

  p 'i hear commands'
  # HUE LIGHTS #
  if command.scan(/spotify/).length > 0
    p "I hear you say spotify"
    process_spotify(command, nil)
  elsif command.scan(/itunes/).length > 0
    p "I hear you say itunes"
    process_itunes(command, hue)
  elsif command.scan(/initiate | pulse | computer/).length > 0
    p 'Welcome to Pulse Control'
    process_initiate(command, hue)
  elsif command.scan(/abort/).length > 0
    p 'Welcome to Pulse Control'
    process_abort(command, hue)
  elsif command.scan(/lights | light/).length > 0
    p 'Welcome to Hue Control'
    process_lights(command, hue)
  elsif command.scan(/setting/).length > 0
    p 'Welcome to mode Control'
    process_mode(command, hue)
  elsif command.scan(/twitch/).length > 0
    p 'Welcome to Twitch Control'
    process_twitch(command, hue)
  end
end

get '/command' do
  process_query(params[:q], hue)
end

get '/status' do
  status 200
end