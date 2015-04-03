def process_lights(command, hue)
  words = command.split(" ")

  hue = PhilipsHue::Bridge.new("my light app", "10.0.1.8")
  light1, light2 = hue.lights

  if command.scan(/off/).length > 0
    light1.off!
    light2.off!

  elsif command.scan(/on/).length > 0
    light1.on!
    light2.on!

  elsif command.scan(/mode/).length > 0
    light1.on!
    light2.on!

  end

end