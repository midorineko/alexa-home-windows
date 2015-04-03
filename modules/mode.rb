def process_mode(command, hue)
  words = command.split(" ")
  light1, light2 = hue.lights

  if command.scan(/smoke/).length > 0
    light1.on!
    light2.on!
    light1.green
    light2.green
    if command.scan(/random/).length > 0
      playlists = RSpotify::Playlist.search('420')
      Launchy.open playlists.sample.instance_variable_get('@external_urls').values[0]
    else
      Launchy.open ('https://open.spotify.com/user/1215877715/playlist/6WkKK7hw0ZWttRrdPMXIbG')
    end


  elsif command.scan(/valve | volvo/).length > 0
    light1.on!
    light2.on!
    light1.red
    light2.red


  end

end