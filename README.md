# README.md

docker contnerization of the famous sip tool [`twinkle`][1]

## Build 

Please clone this repository with `git clone github.com/burgesQ/docker-twinkle`. 

You'll need docker installed and configured.

### Command

Run 

```bash
$ docker build --rm -t twinkle .
```

## Run

That's where it became tricky : 

```
$ docker run --rm -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix \ # share x11 files
  -e DISPLAY="unix$DISPLAY" \        # set display value
  --device /dev/snd \                # share alsa audio
  -v /home/master/config:/root/.twinkle \ # twinkle config files
twinkle
```

sources: 
- https://github.com/mviereck/x11docker/wiki/Container-sound:-ALSA-or-Pulseaudio

[1]: https://github.com/LubosD/twinkle
