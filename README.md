# rpi-djangocms
Raspberry image for djangoCMS. Work in progress.

Tested on Raspberry-Pi 3
## build process

create a dedicated folder, synchronize with **"git init && git remote add origin https://github.com/Nemecle/rpi-djangocms && git pull origin master"**
or just **"git clone https://github.com/Nemecle/rpi-djangocms"** if you don't mind tracking.

then run *"docker build -t rpi-djangocms ."* (docker build with tag rpi-djangocms, from current folder which contains the Dockerfile"

## Running process
run *"docker run -P -d rpi-djangocms"* (-P = attribute a random port to exposed port (8000), -d = detached mode

## To do
* Use a virtualenv: last tries failed as djangocms seemd to be calling system-wise python instead of venv one.
* Put the djangocms user back for better tracking. Currently fails as well
* Add a proper login for admin: can't currently log"
