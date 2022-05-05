#!/bin/sh
exec ss-server \
      -s $ADDR \
      -p $PORT \
      -k ${PASSWORD:-$(hostname)} \
      -m $METHOD \
      -t $TIMEOUT \
      -u \
			--fast-open \
			--plugin /bin/v2ray-plugin \
			--plugin-opts server \
      $ARGS
