# GNU Radio Companion Plus

## Dockerized for ease of use.

GNU Radio Companion 3.8 accessible via VNC and web browser with additional utilities installed.

## Installation on a Mac



First download VirtualBox & Vbox Extensions from Oracle.

To use Docker & have USB passthrough on Mac OS to control your SDR device, you must download an older version of docker-machine as the new versions don't allow it:

https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-Darwin-x86_64

Install it with default settings but without Kitematic.

Open terminal and enter

```bash
$ docker-machine start
```

You must enter this on every terminal window you wish to access docker on:
```bash
$ eval $(docker-machine env)
```

To download the most featured version enter: 
```bash
$ docker pull neuroforlunch/gnuradio-companion-plus:latest`
```

Create a folder called `shared-storage` in your home directory to share files between your docker guest and host computer.
Start it with:

```bash
docker run -p 5900:5900 -p 8080:80 -v ~/shared-storage:/root/shared-storage neuroforlunch/gnuradio-companion-plus:latest
```

Use VNC Viewer to connect to `192.168.99.105:5900`

Or open your browser to: http://192.168.99.105:8080

Your IP given to docker-machine might be different but it will be 192.168.99.XXX where XXX usually starts at 100 or 101.

### Notes
Dockerfiles are in seperate branches and each one builds upon the previous one to make caching more easy.

The major difference between 3.8 and 3.9 is the switch from SWIG to pyBind11 causing a lot of compatibility problems.
Once these are resolved for most modules, support will be added for 3.9.

The goal is to save you hours of installation time and bug fixes so you can get straight to work.
Everything is based on GNURadio 3.8 to make sure all modules are compatible.
