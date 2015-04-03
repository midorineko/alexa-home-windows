require 'rspotify'
require 'watir-webdriver'
require 'launchy'
require_relative './spot_search.rb'

def process_spotify(command)
  RSpotify.authenticate("edc6b110ccfb40f68390945a1ed88b73", "c355cfe898f8471e84966da16772be1e")
  words = command.split(" ")
  words

  if command.scan(/random/).length > 0
    track_name = words.drop(4)
  else
    track_name = words.drop(3)
  end

  # track_name = ["born", "sinner", "stop"]

  if track_name.last == 'stop'
    track_name.pop
  end

  search_track = track_name.join(" ")

  if command.scan(/run/).length > 0
    play_pause()
  elsif command.scan(/off/).length > 0
    WIN32OLE.new("WScript.Shell").SendKeys("^{F6}")

    stop()
    return
  end

  pre_track = Playback.new
  if $FIRST_TRACK
    $FIRST_TRACK.finished()
  end
  $FIRST_TRACK = pre_track
  if command.scan(/track/).length > 0
    tracks = RSpotify::Track.search(search_track)
    first_track = tracks.first
    uri = first_track.instance_variable_get('@external_urls').values[0]

    Launchy.open uri #actually now it is the export url
  elsif command.scan(/artist/).length > 0
    artists = RSpotify::Artist.search(search_track)
    art = artists.first
    top_tracks = art.top_tracks(:US)
    rand_track = art.top_tracks(:US).sample

    pre_track.next_song(rand_track, top_tracks, "random")
  elsif command.scan(/album/).length > 0
    albums = RSpotify::Album.search(search_track)
    album = albums.first
    tracks = album.tracks
    if command.scan(/random/).length > 0
      rand_track = tracks.sample
      pre_track.next_song(rand_track, tracks, "random")
    else
      first_track = tracks[1]
      pre_track.next_song(first_track, tracks, 0)
    end
  elsif command.scan(/style/).length > 0
    playlists = RSpotify::Playlist.search(search_track)
    playlist = playlists.sample
    play_tracks = playlist.tracks
    rand_track = playlist.tracks.sample
    pre_track.next_song(rand_track, play_tracks, "random")
  end

end