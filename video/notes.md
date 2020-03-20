# Raspberry Pi Video

The goal is to find a lightweight tool for displaying video on the raspberry pi that takes advantage of the built in HDMI ports and possibly the GPU.

## Preliminary Research

### Wall Display

The following instructable lists `fbi`, along with `tvservice` and `omxplayer`, as packages that can be used to turn the RaspberryPi into a video wall.

Could be similar to what Amay was working on at brahman-ai.[link](https://github.com/eulphean/brahman-ai/blob/master/VideoInstallation.md)

* [Raspberry Pi Wall Display Without X-Windows
](https://www.instructables.com/id/Raspberry-Pi-Wall-Display-Without-X-Windows/)

### `fbi`

* [Raspberry Pi – Image Viewer](https://claychaplin.com/raspberry/raspberry-pi-image-viewer/)

### `omxplayer`

* [Playing video on the Raspberry Pi](https://www.raspberrypi.org/documentation/usage/video/)
* [Playing Videos on the Raspberry Pi Command Line](https://www.raspberrypi-spy.co.uk/2013/06/playing-videos-on-the-raspberry-pi-command-line/)
* [List of Raspberry Pi Video Players and How to Play Guide](https://www.raspberrypistarterkits.com/guide/raspberry-pi-video-player/)

### APIs

* [Raspberry Pi VideoCore APIs](https://elinux.org/Raspberry_Pi_VideoCore_APIs)
* [PRi_Framebuffer](https://elinux.org/RPi_Framebuffer)

### X server

* [X(7)](https://manpages.debian.org/stretch/xorg-docs-core/X.7.en.html)
* [Xserver](https://manpages.debian.org/stretch/xserver-common/Xserver.1.en.html)
* [startx](https://manpages.debian.org/stretch/xinit/startx.1.en.html)
* [xdm](https://manpages.debian.org/stretch/xdm/xdm.1.en.html)

### Framebuffer

* [How To Use The Framebuffer?](https://www.raspberrypi.org/forums/viewtopic.php?p=1018365)
* [The Frame Buffer DeviceH](https://www.kernel.org/doc/Documentation/fb/framebuffer.txt)
* [OpenGLES writing to a framebuffer device on raspberry pi](https://www.reddit.com/r/opengl/comments/2gx3jn/opengles_writing_to_a_framebuffer_device_on/cko6d0k/)
* [Raspberry Pi Frame buffer](http://magicsmoke.co.za/?p=284)
* [What is the pixel format for Raspberry Pi framebuffer](https://raspberrypi.stackexchange.com/questions/90097/what-is-the-pixel-format-for-raspberry-pi-framebuffer)

### Directfb/Pi

* [DirectFB @ elinux.org](https://elinux.org/DirectFB)
* [DirectFB @ github](https://github.com/DirectFB/directfb)
* [Directfb/Pi](https://www.raspberrypi.org/forums/viewtopic.php?p=144694)
* [DirectFB on raspberry pi - vertical line color problem](https://raspberrypi.stackexchange.com/questions/59841/directfb-on-raspberry-pi-vertical-line-color-problem)

### `tmux`