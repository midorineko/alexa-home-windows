def process_mode(command, hue)
  words = command.split(" ")
  light1, light2 = hue.lights

  if command.scan(/smoke/).length > 0
    light1.on!
    light2.on!
    light1.xy  = [0.2147, 0.7079]
    light2.xy  = [0.2147, 0.7079]
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

  elsif command.scan(/coder | programmer/).length > 0
    light1.on!
    light2.on!
    light1.xy  = [0.3663, 0.3668]
    light2.xy  = [0.3686, 0.3683]


  end

end