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
    p 'hgere in artisajkldhfjasnfvckjahnsvdkjasnvkjav'
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