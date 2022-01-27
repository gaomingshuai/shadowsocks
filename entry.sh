#!/bin/sh

cd /home
sed -i 's/PORT/'$PORT'/g' config.json
sed -i 's/PWD/'$PASSWORD'/g' config.json

/usr/bin/ss-server -c /home/config.json
