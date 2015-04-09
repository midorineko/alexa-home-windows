require 'rspotify'
require 'watir-webdriver'
require 'launchy'

def process_spotify(command, hue)
  RSpotify.authenticate("edc6b110ccfb40f68390945a1ed88b73", "c355cfe898f8471e84966da16772be1e")
  words = command.split(" ")
  words

  if command.scan(/random/).length > 0
    track_name = words.drop(4)
  else
    track_name = words.drop(3)
  end

  if track_name.last == 'stop'
    track_name.pop
  end

  search_track = track_name.join(" ")

  if command.scan(/run/).length > 0
    WIN32OLE.new("WScript.Shell").SendKeys("^{F6}")
  elsif command.scan(/off/).length > 0
    WIN32OLE.new("WScript.Shell").SendKeys("^{F8}")
  elsif command.scan(/next/).length > 0
    WIN32OLE.new("WScript.Shell").SendKeys("^{F7}")
  elsif command.scan(/previous/).length > 0
    WIN32OLE.new("WScript.Shell").SendKeys("^{F5}")
  end


  if command.scan(/track/).length > 0

    tracks = RSpotify::Track.search(search_track)
    first_track = tracks.first
    uri = first_track.instance_variable_get('@external_urls').values[0]
    WIN32OLE.new("WScript.Shell").SendKeys("^{F8}")

    Launchy.open uri #actually now it is the export url
  elsif command.scan(/artist/).length > 0
    artists = RSpotify::Artist.search(search_track)
    art = artists.first
    WIN32OLE.new("WScript.Shell").SendKeys("^{F8}")

    Launchy.open art.instance_variable_get('@external_urls').values[0]
  elsif command.scan(/album/).length > 0
    albums = RSpotify::Album.search(search_track)
    album = albums.first
    WIN32OLE.new("WScript.Shell").SendKeys("^{F8}")

    Launchy.open album.instance_variable_get('@external_urls').values[0]
  elsif command.scan(/style/).length > 0
    playlists = RSpotify::Playlist.search(search_track)
    WIN32OLE.new("WScript.Shell").SendKeys("^{F8}")

    Launchy.open playlists.sample.instance_variable_get('@external_urls').values[0]
  end

end


def process_audio (input, hue) #speaker controll
  if input == 'headphones'
    p 'Headphones'
    light1, light2 = hue.lights
    light1_state = light1.xy
    light2_state = light2.xy
    light1.red
    light2.red
    sleep 1
    light1.xy = light1_state
    light2.xy = light2_state
  elsif input == 'speakers'
    light1, light2 = hue.lights
    light1_state = light1.xy
    light2_state = light2.xy
    light1.blue
    light2.blue
    sleep 1
    light1.xy = light1_state
    light2.xy = light2_state
  elsif input == 'volume_up'

    light1, light2 = hue.lights
    light1_state = light1.xy
    light2_state = light2.xy
    light1.xy = [0.3739, 0.2445]
    light2.xy = [0.3739, 0.2445]
    sleep 1
    light1.xy = light1_state
    light2.xy = light2_state
  elsif input == 'volume_down'

    light1, light2 = hue.lights
    light1_state = light1.xy
    light2_state = light2.xy
    light1.xy  = [0.6413, 0.3513]
    light2.xy  = [0.6413, 0.3513]
    sleep 1
    light1.xy = light1_state
    light2.xy = light2_state
  elsif input == 'volume_mute'
    light1, light2 = hue.lights
    light1_state = light1.xy
    light2_state = light2.xy
    light1.red
    light2.red
    sleep 1
    light1.xy = light1_state
    light2.xy = light2_state
  end
end