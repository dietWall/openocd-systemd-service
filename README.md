# Overview

This repo builds a service debian package for an openocd service in my build and debugging environment.


# Installation

## Prerequisites
- A Linux PC (Ubuntu, Debian) with: openocd installed
- Download the debian package to your Linux PC

```
wget https://github.com/dietWall/openocd-systemd-service/releases/download/v0.0.1/openocd-service_0.0.1.deb
```

- install the debian package: 
```
sudo dpkg -i openocd-service_0.0.1.deb
```

## Service Activation
- determine your configuration files for openocd (depends on your board, debugger,network and so on)
- write all required openocd arguments to a txt file in your home directory, you can take default.txt as an example

- activate and start the service:

```
sudo systemctl enable openocd-service@$(systemd-escape --path /path/to/your/arguments_file).service  
sudo systemctl start openocd-service@$(systemd-escape --path /path/to/your/arguments_file).service  
```

Openocd should be running in background, you can verify this by typing:
```
systemctl status openocd-service@$(systemd-escape --path /path/to/your/arguments_file).service
```

Watch out:  
STM32CubeIde is not compatible with openocd in my environment. I´m using a custom docker container and VSCode for development and debugging.
