#!/bin/sh

echo $FLAG > /flag.txt
unset FLAG

/usr/bin/stdbuf -i0 -o0 -e0 /app/challenge.bash
