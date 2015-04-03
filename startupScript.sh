#!/bin/bash

cd ~/Desktop/alexa-home-master
source ~/.env
bundle exec ruby app.rb &
bundle exec ruby watir-login.rb && ruby app.rb
