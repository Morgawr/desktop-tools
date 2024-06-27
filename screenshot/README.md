# Screenshot

These scripts are used to monitor my screenshot directory and resize the image
by cutting it in half. This is because my dpi scaling on one of the monitor is
2x the normal size, and due to (what I assume is) a KDE/wayland bug, the entire
image is stored at 2x the size.

For this reason, I run an incron script that checks if there's a new screenshot
and resizes it, while removing the original.

To run this, you need to also install incron and add the following table (adjust
the command to fit your own system paths):

```
/home/morg/Pictures/Screenshots IN_CREATE /home/morg/bin/post_screenshot_monitor.sh $@/$#
```
