#!/bin/bash
sudo dpkg --list 'linux-image-*-generic' | awk '{print }' | grep ^linux | grep -v $(uname -r) | xargs sudo apt-get purge -y
