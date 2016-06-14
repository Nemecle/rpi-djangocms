# rpi-djangocms
Raspberry image for djangoCMS. Work in progress.

Tested on Raspberry-Pi 3
Using hypriot's docker

## Usage

### build
create a dedicated folder, synchronize with **"git init && git remote add origin https://github.com/Nemecle/rpi-djangocms && git pull origin master"**
or just **"git clone https://github.com/Nemecle/rpi-djangocms"** if you don't mind tracking.

then run **"docker build -t rpi-djangocms ."** (docker build with tag rpi-djangocms, from current folder which contains the Dockerfile"

### Run
run **"docker run -P -d rpi-djangocms"** (-P = attribute a random port to exposed port 8000, -d = detached mode)

### Production
* Just connect your front server to the attributed port (run **docker ps -a** to see)
* Use *docker exec -it <id of the container> -bash** and once in **/home/djangocms/website/app/manage.py shell** to access server console
## To do
* Use a virtualenv: last tries failed as djangocms seemed to be calling system-wise python instead of venv one.
* Put the djangocms user back for better tracking. Currently fails as well
* Add a proper login for admin: can't currently log
* change contact mail to personal one (currently offline)
* use volumes to firstly ease backup of data and secondly to optimize static file delivery with direct link in nginx to speed it up.

## Credits
First admin inserting command taken from https://hub.docker.com/r/bluszcz/djangocms/~/dockerfile/
