#! /usr/bin/env sh

SWAYSOCK=$(find /run/user/1000/ -name "sway-*" -print -quit) swaymsg $1
