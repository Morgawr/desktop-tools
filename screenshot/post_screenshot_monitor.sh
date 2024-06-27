#!/bin/bash

IN_FILE="$1"

case "$IN_FILE" in
  *Screenshot*-rescaled.png)
    exit 0
    ;;
  *Screenshot*.png)
    echo "Identified file to resize, continuing."
    ;;
  *)
    exit 0
esac

# We need to wait for the file to be fully created
sleep 2

OUT_FILE="${IN_FILE%.*}-rescaled.png"

/home/morg/bin/rescale.sh $IN_FILE $OUT_FILE

echo "Resized $IN_FILE to $OUT_FILE."

echo "Removing original file."

rm "$IN_FILE"
