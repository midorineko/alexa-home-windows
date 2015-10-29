def process_lights(command, hue)
  words = command.split(" ")

  light1, light2, light3 = hue.lights

  if command.scan(/off/).length > 0
    light1.off!
    light2.off!
    light3.off!

  elsif command.scan(/on/).length > 0
    light1.on!
    light2.on!
    light3.on!

  elsif command.scan(/green/).length > 0
    light1.on!
    light2.on!
    light3.on!
    light1.xy  = [0.2147, 0.7079]
    light2.xy  = [0.2147, 0.7079]
    light3.xy  = [0.2147, 0.7079]
  end

end

def process_room(command, hue)
  words = command.split(" ")
  light1, light2, light3 = hue.lights
  light1.on!
  light2.on!
  light3.on!
  if command.scan(/jennys | jenny's | jenni's | jenny/).length > 0
    light1.xy  = [0.1781, 0.2289]
    light2.xy  = [0.1417, 0.0822]
    light3.xy  = [0.1417, 0.0822]
  elsif command.scan(/stevens | steven's | steven/).length > 0
    light1.xy  = [0.2169, 0.1091]
    light2.xy  = [0.2169, 0.1091]
    light3.xy  = [0.5278, 0.224]
  end
end