#!/usr/bin/bash

source "${HOME}/.xprofile"

# export QT_QPA_PLATFORM="wayland-egl"
# GDK_BACKEND=wayland 

export QT_QPA_PLATFORM="xcb"
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export _JAVA_AWT_WM_NONREPARENTING=1

sway
