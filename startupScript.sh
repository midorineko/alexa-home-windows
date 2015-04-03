#!/bin/bash

cd ~/Desktop/alexa-home-master
source ~/.env
bundle exec ruby app.rb &
bundle exec ruby watir-login.rb && ruby app.rb
hue = PhilipsHue::Bridge.new("my light app", "10.0.1.8")
light1, light2 = hue.lights
p light1