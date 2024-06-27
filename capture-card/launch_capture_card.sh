#!/bin/bash

INPUT_NAME="alsa_input.usb-MACROSILICON_USB_Video-02.analog-stereo"
SINK_NAME="alsa_output.usb-Lexicon_Lexicon_Alpha-00.analog-stereo"
SRC=$(pactl list sources | grep "Name: $INPUT_NAME" -B 2 | head -n 1 | sed 's/[a-zA-Z #]//g')
SINK=$(pactl list sinks | grep "Name: $SINK_NAME" -B 2 | head -n 1 | sed 's/[a-zA-Z #]//g')

# Listen to direct audio feed
pactl load-module module-loopback latency_msec=50 source=$SRC sink=$SINK

# Launch video feed
gamescope -h 1080 -H 1440 -r 60 -f -F linear --sharpness 20 --prefer-vk-device \
  --force-windows-fullscreen -- \
  mpv --profile=low-latency --video-sync=display-resample-vdrop \
  --video-sync-max-video-change=100 --interpolation \
  --demuxer-lavf-o-set=input_format=mjpeg --no-osc \
  --profile=gpu-hq --gpu-api=vulkan --framedrop=vo \
  --no-hidpi-window-scale --dscale=ewa_lanczos \
  --video-sync=display-resample \
  /dev/video0

# Stop audio feed
pactl unload-module module-loopback
