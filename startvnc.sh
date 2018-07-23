#!/bin/bash
/opt/TurboVNC/bin/vncserver -log /tmp/vnclog.out -otp 2>&1 | grep "one-time"
tail -f /tmp/vnclog.out
