FROM debian:latest

RUN apt-get update && apt-get install -y openocd make

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash"]
