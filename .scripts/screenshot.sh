#!/bin/bash

spath=~/Documents/temp.png
sleep .2
maim -s -u $spath
xclip -selection clipboard -t image/png -i $spath
