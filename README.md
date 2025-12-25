# Overview

This repo builds a service debian package for an openocd service in my build and debugging environment.


# Installation

## Prerequisites
- A Linux PC (Ubuntu, Debian) with: openocd installed
- Download the debian package to your Linux PC
- install: 
```
sudo dpkg -i openocd-service_0.0.1.deb
```

# Service Activation
- determine your configuration files for openocd (depends on your board, debugger,network and so on)
- write all required files to a txt file in your home directory, default_args.txt is an example for the format
- in bash: systemd-escape --path /path/to/your/arguments_file
- take the output and type:

```
sudo systemctl enable openocd-service@<output_from_systemd_escape>.service  
sudo systemctl start openocd-service@<output_from_systemd_escape>.service  
```

Openocd should be running in background, you can verify this by typing:
```
systemctl status openocd-service@home-dw-openocd.default.txt.service
```

Watch out: STM32CubeIde is not compatible with openocd in my environment. I am using a custom devcontainer for development and debugging.