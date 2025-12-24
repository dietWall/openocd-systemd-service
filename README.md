# Overview

This repo builds a service debian package for an openocd service in my build and debugging environment.


# Installation
Build and Release in Github Actions is WIP
Otherwise:

you need dpkg-deb and openocd installed

- clone the repo
- make all => generates the package
- dpkg -i build/openocd-service_0.0.1.deb => installs the package

# Activation
- determine your configuration files for openocd, 
- write all required files to a txt file in your home directory, default_args.txt is an example for the format
- in bash: systemd-escape --path /path/to/your/arguments_file
- take the output and type:
sudo systemctl enable openocd-service@<output_from_systemd_escape>.service
sudo systemctl start openocd-service@<output_from_systemd_escape>.service

Openocd should be running in background