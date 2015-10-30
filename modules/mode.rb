def process_mode(command, hue)
  words = command.split(" ")
  light1, light2, light3 = hue.lights

  if command.scan(/smoke | smoking/).length > 0
    WIN32OLE.new("WScript.Shell").SendKeys("^{F8}")
    light1.on!
    light2.on!
    light3.on!
    light1.xy  = [0.2147, 0.7079]
    light2.xy  = [0.2147, 0.7079]
    light3.xy  = [0.2147, 0.7079]
    if command.scan(/random/).length > 0
      WIN32OLE.new("WScript.Shell").SendKeys("^{F8}")
      playlists = RSpotify::Playlist.search('420')
      Launchy.open playlists.sample.instance_variable_get('@external_urls').values[0]
    else
      WIN32OLE.new("WScript.Shell").SendKeys("^{F8}")
      Launchy.open ('https://open.spotify.com/user/1215877715/playlist/6WkKK7hw0ZWttRrdPMXIbG')
    end
  elsif command.scan(/valve | volvo | doda | dota/).length > 0
    WIN32OLE.new("WScript.Shell").SendKeys("^{F8}")
    light1.on!
    light2.on!
    light3.on!
    light1.red
    light2.red
    light3.red
    Launchy.open ('https://open.spotify.com/user/1215877715/playlist/3XUn5HVXEWi88raARlpshs')
  elsif command.scan(/coder | programmer/).length > 0
    WIN32OLE.new("WScript.Shell").SendKeys("^{F8}")
    light1.on!
    light2.on!
    light3.on!
    light1.xy  = [0.3663, 0.3668]
    light2.xy  = [0.3686, 0.3683]
    light3.xy  = [0.3686, 0.3683]
  end
end