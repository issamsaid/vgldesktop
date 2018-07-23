FROM nvidia/cuda

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y xserver-xorg xorg icewm vim mesa-utils wget module-init-tools bash-completion

RUN wget http://us.download.nvidia.com/tesla/396.26/NVIDIA-Linux-x86_64-396.26.run -O /tmp/NVIDIA-Linux-x86_64-396.26.run ; chmod +x /tmp/NVIDIA-Linux-x86_64-396.26.run ; /tmp/NVIDIA-Linux-x86_64-396.26.run --no-kernel-module -s

RUN nvidia-xconfig --no-use-display-device --enable-all-gpus

RUN wget https://downloads.sourceforge.net/project/virtualgl/2.5.2/virtualgl_2.5.2_amd64.deb -O /tmp/virtualgl_2.5.2_amd64.deb ; dpkg -i /tmp/virtualgl_2.5.2_amd64.deb

RUN wget https://downloads.sourceforge.net/project/turbovnc/2.1.2/turbovnc_2.1.2_amd64.deb -O /tmp/turbovnc_2.1.2_amd64.deb ; dpkg -i /tmp/turbovnc_2.1.2_amd64.deb

RUN echo "permitted-security-types = OTP" > /etc/turbovncserver-security.conf

RUN mkdir /tmp/.vnc ; echo "/usr/bin/icewm" > /tmp/.vnc/xstartup.turbovnc ; chmod +x /tmp/.vnc/xstartup.turbovnc
#
ADD ["startx.sh", "/startx.sh"]
ADD ["startvnc.sh", "/startvnc.sh"]
#ENTRYPOINT ["/entrypoint.sh"]
