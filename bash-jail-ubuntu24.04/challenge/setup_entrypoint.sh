#!/bin/sh

echo $FLAG > /jail/flag.txt
cat /jail/flag.txt
unset FLAG

# add "-m none:/DESTPATH:tmpfs:size=N" before --cwd on nsjail args to have a tmpfs-backed writable DESTPATH of N bytes
# remember that /DESTPATH cannot contain any files coming from /jail (as its a mount). If you want 
# pre-created/copied files in /DESTPATH you should manually copy them in entrypoint.sh
# Note: /DESTPATH should not contain /jail as a prefix
nsjail \
    --mode l \
    --disable_proc \
    --time_limit ${TIMEOUT} \
    --bindhost 0.0.0.0 \
    --port 1337 \
    --bindmount_ro /jail:/ \
    -m none:/dev:tmpfs:mode=555,size=1,uid=65534,gid=65534 \
    -R /dev/urandom \
    -R /dev/random \
    -B /dev/null \
    -R /dev/zero \
    --cwd /app/ \
    -u 1337:1337:1 \
    -g 1337:1337:1 \
    -u 65534:65534:1 \
    -g 65534:65534:1 \
    -- /app/entrypoint.sh