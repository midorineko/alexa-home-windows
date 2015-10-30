#!/bin/bash

cd ~/Desktop/alexa-home-master
source ~/.env
bundle exec ruby app.rb
bundle exec ruby watir-login.rb
hue = PhilipsHue::Bridge.new("my light app", "10.0.1.8")
light1, light2 = hue.lights
p light1


colors = Miro::DominantColors.new('C:\Users\TheoryandPractice\Desktop\alexa-home-windows\wolf.jpg')

kolors = Kolors::DominantColors.new('wolf.jpg')

histogram = Histogram.new('wolf.jpg')

image = MiniMagick::Image.open("wolf.jpg")
