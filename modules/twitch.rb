def process_twitch(command, hue)
  ENV["SSL_CERT_FILE"] = "C:/Ruby21/lib/ruby/2.1.0/rubygems/ssl_certs/cacert.pem"
  dota = JSON.parse open('https://api.twitch.tv/kraken/streams?limit=10&game=Dota%202').read
  active_streams = dota['streams']

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

  streamers.each_with_index do |name, i|
    if name == 'Sing_sing'
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name == 'Sheever'
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name == 'MerliniDota'
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name == 'Pyrionflax'
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name == 'EternaLEnVyy'
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name ==  'wagamamaTv'
      need_to_watch[name] = [viewer_count[i], url[i]]
    elsif name ==  'BeyondTheSummit'
      live = status[i]["REBROADCAST"] ?  false : true
      need_to_watch[name] = [viewer_count[i], url[i], live]
    elsif name == 'dotastarladder_en'
      live = status[i]["REBROADCAST"] ?  false : true
      need_to_watch[name] = [viewer_count[i], url[i], live]
    elsif name == 'joindotared'
      live = status[i]["REBROADCAST"] ?  false : true
      need_to_watch[name] = [viewer_count[i], url[i], live]
    end
  end

  def watch_top_game(games)
    Launchy.open(games.first[1][1])
  end
  watch_top_game(need_to_watch)

end