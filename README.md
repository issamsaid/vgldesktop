# Virtual GL enabled desktop
## Build the container
```
git clone https://github.com/issamsaid/vgldesktop.git
docker build . -t vgldocker
```

## Start X server in a privileged container
```
nvidia-docker run --privileged --rm -ti -v /tmp/.X11-unix:/tmp/.X11-unix vgldesktop /startx.sh
```

## Start VNC server in a non-privileged container
```
nvidia-docker run -ti --rm -p 5901:5901 -u $(id -u):$(id -g) -e USER=$USER -e HOME=$HOME -v $HOME:$HOME -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 vgldesktop /startvnc.sh
```

The container will output the one time password for the VNC session.
Install TurboVNC client on your local system.  https://www.turbovnc.org/

Determine the IP address of the compute node.

Connect to IPADDRESS:1 

Once inside the desktop:
- Right click on desktop
- Open terminal
- Run OpenGL application using vglrun.  For example, vglrun glxgears.


