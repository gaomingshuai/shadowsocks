FROM shadowsocks/shadowsocks-libev
USER root

# 准备V2RAY 插件
WORKDIR /home
RUN wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.1/v2ray-plugin-linux-386-v1.3.1.tar.gz -O v2ray.tar.gz 
RUN tar x -f v2ray.tar.gz 

# 第二阶段
FROM alpine:latest

USER root
WORKDIR /home
COPY --from=0 /usr/bin/ss-server /usr/bin/ss-server
COPY --from=0 /usr/lib/* /usr/lib/
COPY --from=0 /home/v2ray-plugin_linux_386 /bin/v2ray-plugin


USER nobody

ENV ADDR 0.0.0.0
ENV PORT 8080
ENV PASSWORD=
ENV METHOD      aes-256-gcm
ENV TIMEOUT     300
ENV DNS_ADDRS   8.8.8.8,8.8.4.4
ENV TZ=Asia/Shanghai
ENV ARGS=

COPY entrypoint.sh /home/entrypoint.sh

CMD ["/bin/sh","/home/entrypoint.sh"]
