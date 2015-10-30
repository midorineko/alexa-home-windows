# Alexa Home

Welcome to Alexa Home Midori Style! I love the amazon echo, but the lack of support for applications is eating me alive. I am currently adapating Zfeldmans original use of Alexa-Home, to help build applications that make alexa work more seamlessly with my current home setup.


## Setting up

You'll need to clone the repository from GitHub in the Terminal. I recommend putting it in the folder `~/dev/alexa-home`

You'll also need to set some environmental variables, which could be accomplished like this:

````bash
# in a file called .env, located at ~
# try vim ~/.env or nano ~/.env

export NEST_EMAIL=your_nest_email@awesome.com
export NEST_PASS=your_nest_password_not_test123

export AMAZON_EMAIL=youramazonlogin
export AMAZON_PASSWORD=your_awesome_pass_not_12345
````

For more, check out [Using Environment Variables to Safely Store API Credentials](http://blog.zfeldman.com/2014-04-07-Using-Environment-Variables-to-Safely-Store-API-Credentials)(

## Getting Started

This has to be run on the same network your Hue is on, but not necessarily the same network your Echo is on.

1) Clone this repository (see the link on the right) or download it as a zip file.

2) Open up the directory in your terminal application by dragging it into Terminal from the Finder or using the `cd` (change directory) command, I.E. `cd /home/pi/dev/alexa-home`

3) Run `bundle install` (I'm assuming you have Ruby 2.0+, using `ruby -v` to find out, if not try rbenv or rvm to upgrade).

3) If you plan on using a Hue setup, go to https://www.meethue.com/api/nupnp and infd you internal IP address
----insert it in line 32 of app.rb

4) Go to ech.amazon.com on the browser, find the settings tab, go to history, open up the console then paste the monitoring snippet.
---really sorry that isn't easier on windows. I'll figure out a way soon, since it is so kinda sucks.
****I just wrote a script that will do all this for you and hide it off screen. Will post it soon.

 5)I run the program with ruby app.rb like normal.
 ****I made an auto run script for windows. Using this stackoverflow. http://stackoverflow.com/questions/23205169/auto-run-ruby-script-on-windows-start

 Current Modules
 -Hue lights
 -Basic Spotify
 -Computer Controle
 -itunes(zach)
 -twitch and weather html stuff

1) Type `ps aux | grep ruby` at the Terminal to see a list of running Ruby processes

2) If you see the server (app.rb) or the Watir runner (watir-login.rb) and want to stop either of them, type `sudo kill -9 <PID>` , PID corresponding to the program's process ID.

## Contributors

[@zachfeldman](https://twitter.com/zachfeldman)
[@midorineko](residentsleeper.blogspot.com)

## Contributing

Send in pull requests!


## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.
