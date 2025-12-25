#! /bin/bash

#according github docu: workspace is mounted at /github/workspace
ls -la /
ls -la /github/workspace

cd /github/workspace
make all 
