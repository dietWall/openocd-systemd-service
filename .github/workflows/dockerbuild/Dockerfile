FROM debian:latest

RUN apt-get update && apt-get install -y openocd

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
