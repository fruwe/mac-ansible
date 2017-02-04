#!/bin/bash
# Purpose:
#       * download mac-ansible and start updating the system

set -e

mkdir -p ~/src

if [[ -d ~/src/mac-ansible ]]; then
    echo "Info     | mac-ansible | Pull"
    cd ~/src/mac-ansible && git pull
else
  echo "Info     | mac-ansible | Clone"
  cd ~/src && git clone https://github.com/fruwe/mac-ansible.git
  cd mac-ansible
fi

cd ~/src/mac-ansible && ./bootstrap.sh
