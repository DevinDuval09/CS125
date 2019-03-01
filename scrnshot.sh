#!/bin/bash

find ~/Documents -type d

echo "Enter destination in Documents:"

read pth

echo "Enter filename:"

read name

gnome-screenshot -f ~/Documents/$pth/$name'.png'
