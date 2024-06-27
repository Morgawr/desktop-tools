#!/bin/bash

SRC="$1"

if [ $# -lt 2 ]; then
  DST="$1"
else
  DST="$2"
fi

magick "$1" -resize 50% "$2"
