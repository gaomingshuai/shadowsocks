FROM shadowsocks/shadowsocks-libev

USER root
WORKDIR /home
# RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
# RUN apk add shadowsocks-libev
RUN wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.1/v2ray-plugin-linux-386-v1.3.1.tar.gz -O v2ray.tar.gz && \
    tar x -f v2ray.tar.gz && \
    rm v2ray.tar.gz && \
    mv v2ray-plugin_linux_386 /bin/v2ray-plugin

COPY entry.sh /home/entry.sh
COPY config.json /home/config.json

ENTRYPOINT ["/bin/sh","/home/entry.sh"]
