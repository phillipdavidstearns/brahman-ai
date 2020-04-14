#!/bin/bash

source export DISPLAY=:0
xset -dpms & xset s noblank & xset s off
exit $?