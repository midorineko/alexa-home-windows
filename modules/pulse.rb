def process_initiate(command, hue)

  light1, light2 = hue.lights
words = command.split(" ")


  if command.scan(/game/).length > 0
    if command.scan(/one/).length > 0
      p "excellent!"
    end

  elsif command.scan(/termination|terminate/).length > 0
    light1.off!
    light2.off!
    if command.scan(/now/).length > 0
      system("shutdown.exe -s -f -t 0")
    end
    termination_count = words.pop.in_numbers
    system("shutdown.exe -s -f -t #{termination_count}")
  end

end

def process_abort(command)
  words = command.split(" ")

  if command.scan(/game/).length > 0
    if command.scan(/one/).length > 0
      p "excellent!"
    end

  elsif command.scan(/termination|terminate/).length > 0

    system("shutdown.exe -a")
  end

end