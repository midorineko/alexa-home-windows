def process_twitch(command, hue)
  ENV["SSL_CERT_FILE"] = "C:/Ruby21/lib/ruby/2.1.0/rubygems/ssl_certs/cacert.pem"
  dota = JSON.parse open('https://api.twitch.tv/kraken/streams?limit=10&game=Dota%202').read
  active_streams = dota['streams']

  p '============================================================'
  streamers = []
  viewer_count = []
  url = []
  active_streams.each do |x|
    streamers << x['channel']['display_name']
    viewer_count << x['viewers']
    url << x['channel']['url']
  end
  p streamers
  p viewer_count
  p url
  p '============================================================'

end