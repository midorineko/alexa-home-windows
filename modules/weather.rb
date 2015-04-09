require 'weather-api'

def process_weather(command, hue)
  response = Weather.lookup(12797158, Weather::Units::CELSIUS)
  light1, light2 = hue.lights
  light1_state = light1.xy
  light2_state = light2.xy
  temp = (response.condition.temp * 9/5 + 32)
  code = response.condition.code
  p '--------------------------------------------------------------------------------------'
  p response.title
  p "#{temp} degrees"
  p response.condition.text
  p '--------------------------------------------------------------------------------------'

  if temp > 90
    light1.xy = [0.7035, 0.2958]
  elsif temp > 80
    light1.xy = [0.5717, 0.4061]
  elsif temp > 70
    light1.xy = [0.5717, 0.4061]
  elsif temp > 60
    light1.xy = [0.4204, 0.4822]
  elsif temp > 50
    light1.xy = [0.2623, 0.3547]
  elsif temp > 40
    light1.xy = [0.1445, 0.0832]
  else
    light1.xy = [0.3103, 0.3289]
  end

  if [26, 27, 28, 29, 30, 44].include? code #cloudy
    light2.xy = [0.3317, 0.2346]
  elsif [8,9,11,12,40,42,45,47].include? code #showers
    light2.xy = [0.2117, 0.2069]
  elsif [1,3,4,37,38,39,40].include? code #storms
    light2.xy = [0.7035, 0.2958]
  elsif [5,7,10,17,13,14,15,16,35,41,42,43,46].include? code #snow
    light2.xy = [0.3103, 0.3289]
  elsif [24,25].include? code #cold, windy
    light2.xy = [0.1418, 0.0822]
  elsif [32,33,34,36].include? code #good weather
    light2.xy = [0.2678, 0.5293]
  end

  sleep 5
  light1.xy = light1_state
  light2.xy = light2_state
end