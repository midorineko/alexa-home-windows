def process_twitch(command, hue)
  words = command.split(" ")
  ENV["SSL_CERT_FILE"] = "C:/Ruby21/lib/ruby/2.1.0/rubygems/ssl_certs/cacert.pem"
  dota = JSON.parse open('https://api.twitch.tv/kraken/streams?limit=10&game=Dota%202').read
  active_streams = dota['streams']
  light1, light2 = hue.lights

  streamers = []
  viewer_count = []
  url = []
  status = []
  active_streams.each do |x|
    streamers << x['channel']['display_name']
    viewer_count << x['viewers']
    url << x['channel']['url']
    status << x['channel']['status']
  end
  url = url.reverse
  status = status.reverse
  viewer_count = viewer_count.reverse
  p streamers
  p viewer_count
  p url

  if viewer_count .first > 15000
    p 'over 15000'
  elsif viewer_count .first > 10000
    p 'over 10000'
  else
    p 'less than 10000'
  end

  need_to_watch = {}

def live(life, light2)
  if life === false
    light2.red
    light2.blip
  else
    light2.green
    light2.blip
  end
end

  streamers.reverse.each_with_index do |name, i|
    if name == 'Sing_sing'
      light1.xy = [0.3739, 0.2445]
      light2.xy = [0.3739, 0.2445]
      light2.blip
      light1.blip
      sleep 2
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name == 'Sheever'
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name == 'MerliniDota'
      light1.xy = [0.2657, 0.4364]
      light2.xy = [0.2657, 0.4364]
      light2.blip
      light1.blip
      sleep 2
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name == 'Pyrionflax'
      light1.xy = [0.3739, 0.2445]
      light2.xy = [0.3739, 0.2445]
      light2.blip
      light1.blip
      sleep 2
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name == 'EternaLEnVyy'
      light1.xy = [0.3739, 0.2445]
      light2.xy = [0.3739, 0.2445]
      light2.blip
      light1.blip
      sleep 2
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name ==  'WagamamaTV'
      light1.xy  = [0.4951, 0.4807]
      light2.xy  = [0.4951, 0.4807]
      light2.blip
      light1.blip
      sleep 2
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name ==  'BananaSlamJamma'
      light1.xy  = [0.6413, 0.3513]
      light2.xy  = [0.6413, 0.3513]
      light2.blip
      light1.blip
      sleep 2
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name ==  'BeyondTheSummit'
      light1.xy  = [0.2162, 0.108]
      light1.blip
      live = status[i]["REBROADCAST"] ?  false : true
      live(live, light2)
      sleep 2
      need_to_watch[name] = [viewer_count[i], url[i], live]
    elsif name == 'dotastarladder_en'
      light1.xy  = [0.2127, 0.1076]
      light1.blip
      live = status[i]["REBROADCAST"] ?  false : true
      live(live, light2)
      sleep 2
      need_to_watch[name] = [viewer_count[i], url[i], live]
    elsif name == 'joindotared'
      light1.xy = [0.525, 0.2228]
      light1.blip
      live = status[i]["REBROADCAST"] ?  false : true
      live(live, light2)
      sleep 2
      need_to_watch[name] = [viewer_count[i], url[i], live]
    end
  end

  def watch_top_game(games)
    hero = games.keys.last
    Launchy.open(games[hero][1])
  end

  def watch_specific_game(games, num)
    hero = games.keys[num]
    Launchy.open(games[hero][1])
  end

  if command.scan(/watch/).length > 0
    watch_top_game(need_to_watch)
  end

  if command.scan(/stream/).length > 0
    which_stream = words.pop.in_numbers
    watch_specific_game(need_to_watch, which_stream)
  end

end