require 'sinatra'

require './helpers'
require 'rspotify'
require 'launchy'
require 'watir-webdriver'


# require 'appscript'
# require 'osax'
require 'win32ole'

require './modules/spotify'
require './modules/itunes'
require './modules/pulse'
require './modules/lights'
require './modules/mode'
require './modules/twitch'
require './modules/weather'


require 'open-uri'
require 'json'
require 'philips_hue'


require 'numbers_in_words'
require 'numbers_in_words/duck_punch'

hue = PhilipsHue::Bridge.new("my light app", "10.0.1.8")
RSpotify.authenticate("edc6b110ccfb40f68390945a1ed88b73", "c355cfe898f8471e84966da16772be1e")



def process_query(command, hue)
  p '=============================================================='
  p command.split(" ")
  p '=============================================================='

  p 'i hear commands'
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
  elsif command.scan(/setting|session/).length > 0
    p 'Welcome to mode Control'
    process_mode(command, hue)
  elsif command.scan(/twitch/).length > 0
    p 'Welcome to Twitch Control'
    process_twitch(command, hue)
  elsif command.scan(/room/).length > 0
    p 'Welcome to Room Control'
    process_room(command, hue) #held within the light module
  elsif command.scan(/headphones/).length > 0
    WIN32OLE.new("WScript.Shell").SendKeys("^{F12}") #held within the light module
    process_audio('headphones', hue) #held within spotify
  elsif command.scan(/speakers/).length > 0
    p 'Speakers'
    WIN32OLE.new("WScript.Shell").SendKeys("^{F11}") #held within the light module
    process_audio('speakers', hue)
  elsif command.scan(/louder/).length > 0
    p 'Volume Up'
    WIN32OLE.new("WScript.Shell").SendKeys("^{F3}")#held within the light module
    process_audio('volume_up', hue)
  elsif command.scan(/lower/).length > 0
    WIN32OLE.new("WScript.Shell").SendKeys("^{F2}")#held within the light module
    p 'Volume Down'
    WIN32OLE.new("WScript.Shell").SendKeys("^{F2}") #held within the light module
    process_audio('volume_down', hue)
  elsif command.scan(/mute/).length > 0
    p 'Volume Mute'
    WIN32OLE.new("WScript.Shell").SendKeys("^{F1}") #held within the light module
    process_audio('volume_mute', hue)
  elsif command.scan(/weather/).length > 0
    p 'Tell me the weather'
    process_weather(command, hue) #held within light module
  end
end



get '/command' do
  process_query(params[:q], hue)
end

get '/status' do
  status 200
end