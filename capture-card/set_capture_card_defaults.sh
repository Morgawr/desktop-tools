#!/bin/bash
v4l2-ctl \
  --set-ctrl=brightness=7 \
  --set-ctrl=contrast=126 \
  --set-ctrl=saturation=121 \
  --set-ctrl=hue=0 \
  -d /dev/video0
