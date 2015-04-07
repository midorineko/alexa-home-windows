def process_lights(command, hue)
  words = command.split(" ")

  light1, light2 = hue.lights

  if command.scan(/off/).length > 0
    light1.off!
    light2.off!

  elsif command.scan(/on/).length > 0
    light1.on!
    light2.on!

  elsif command.scan(/green/).length > 0
    light1.on!
    light2.on!
    light1.xy  = [0.2147, 0.7079]
    light2.xy  = [0.2147, 0.7079]
  end

end

def process_room(command, hue)
  words = command.split(" ")
  light1, light2 = hue.lights
  if command.scan(/jenny | jenni/).length > 0
    light1.on!
    light2.on!
    light1.xy  = [0.1781, 0.2289]
    light2.xy  = [0.1417, 0.0822]
  elsif command.scan(/steven/).length > 0
    light1.on!
    light2.on!
    light1.xy  = [0.2169, 0.1091]
    light2.xy  = [0.2169, 0.1091]
  end
end

