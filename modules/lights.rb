def process_lights(command, hue)
  words = command.split(" ")

  light1, light2 = hue.lights

  if command.scan(/off/).length > 0
    light1.off!
    light2.off!

  elsif command.scan(/on/).length > 0
    light1.on!
    light2.on!

  end

end

