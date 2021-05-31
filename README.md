# GNU Radio Companion Plus: Dockerized for ease of use.

<p align="center">
<img src="https://github.com/NeuroForLunch/gnuradio-darkmode/raw/maint-3.8/docs/gnuradio.png" width="75%" />
</p>

<p align="center">
<img src="https://github.com/NeuroForLunch/gnuradio-darkmode/raw/maint-3.8/docs/darkmode-1.png" width="100%" />
</p>


### GNU Radio Companion 3.8 accessible via VNC with additional utilities installed.

## Installation on a Mac


First download VirtualBox & Vbox Extensions from Oracle.

To use Docker & have USB passthrough on Mac OS to control your SDR device, you must download an older version of docker-machine as the new versions don't allow it:

https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-Darwin-x86_64

Install it with default settings but without Kitematic.

Open terminal and enter

```bash
$ docker-machine create -d virtualbox default
$ docker-machine env default
$ eval $(docker-machine env)
```

When you reboot you might have to enter this:
```bash
$ docker-machine start
$ eval $(docker-machine env)
```

To download the most featured version enter: 
```bash
$ docker pull neuroforlunch/gnuradio-companion-plus:latest`
```

Create a folder called `shared-storage` in your home directory to share files between your docker guest and host computer.
Start it with:

```bash
docker run -p 5900:5900 -p -v ~/shared-storage:/root/shared-storage neuroforlunch/gnuradio-companion-plus:latest
```

Use VNC Viewer to connect to the IP address given by 
```bash
$ docker-machine env default
```

### Notes
Dockerfiles are in seperate branches and each one builds upon the previous one to make caching more easy.

The major difference between 3.8 and 3.9 is the switch from SWIG to pyBind11 causing a lot of compatibility problems.
Once these are resolved for most modules, support will be added for 3.9.

The goal is to save you hours of installation time and bug fixes so you can get straight to work.
Everything is based on GNURadio 3.8 to make sure all modules are compatible.
