#!/bin/bash


# pkill swaybg

WALL_DIR=/home/matthew/.config/backgrounds/
WALLPAPER=$(find $WALL_DIR -depth -maxdepth 1 -type f | shuf -n 1)

# Kill all swaybg process older than 5 sec
pkill swaybg -O 5


swaybg -i $WALLPAPER -m fill &



# echo $WALLPAPER

# ln -f $WALLPAPER /home/matthew/.config/niri/bg


