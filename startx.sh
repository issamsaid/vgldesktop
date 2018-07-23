#!/bin/bash
rm -rf /tmp/.X11-unix/X0/
/usr/bin/X -noreset &> /dev/null &
sleep 5
watch nvidia-smi
