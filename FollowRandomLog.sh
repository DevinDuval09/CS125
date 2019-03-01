#!/bin/bash

shuf /bin/myscripts/loglist.txt | tail -n 1 | xargs locate | xargs echo |  xargs tail -f


