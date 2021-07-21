#!/bin/bash

esp_idf_version="$1"

echo -e "\n## Installing prerequisites"

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

sudo apt-get install -y git wget flex bison gperf python3 python3-pip python3-setuptools python-is-python3 python3-libusb1 cmake ninja-build ccache libffi-dev libssl-dev dfu-util

mkdir ~/esp
cd ~/esp

case $esp_idf_version in
  latest)
    git clone --recursive https://github.com/espressif/esp-idf.git
    ;;
  *)
    git clone -b $esp_idf_version --recursive https://github.com/espressif/esp-idf.git
    ;;
esac

cd ~/esp/esp-idf

echo -e "\n## Installing tools"
./install.sh > ~/esp-idf-install.log 2>&1
