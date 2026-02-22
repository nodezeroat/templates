#!/bin/sh

httpd-foreground &

cd dist
. /.venv/bin/activate 2>&1 >/dev/null
export PATH="/.venv/bin:$PATH"
python3 generate.py

cd ..
tar -czvf challenge.tar.gz dist/
mv challenge.tar.gz /usr/local/apache2/htdocs/challenge.tar.gz

sleep infinity