#! /bin/bash

openocd_args="--help"

while getopts 'df:h' opt; do
  case "$opt" in
    f)
        echo "$(basename $0): Reading file: $OPTARG"
        PATH_TO_FILE=$(systemd-escape -u -p "$OPTARG")
        openocd_args=$(cat "$PATH_TO_FILE")
    ;;
    d)
        echo "$(basename $0): Reading file: default_args.txt"
        openocd_args=$(cat "default_args.txt")
        ;;
    ?|h)
        echo "Usage: $(basename $0) [-f <file>] [-h]"
        echo "  -f <file> : Specify the file to read and take as parameters for openocd execution"
        echo "  -d        : reads default_args.txt file for arguments"
        echo "  -h        : Display this help message"
        exit 0
    ;;
  esac
done


echo $(basename $0): executing: openocd $openocd_args

exec openocd $openocd_args
