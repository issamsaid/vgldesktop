#!/bin/bash
/opt/TurboVNC/bin/vncserver -otp 2>&1 | grep "one-time"
/usr/bin/X -noreset &> /dev/null
