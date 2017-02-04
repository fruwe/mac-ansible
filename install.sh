#!/bin/bash
# Purpose:
#       * download mac-ansible and start updating the system

set -e

mkdir -p ~/src

if [[ -d ~/src/mac-ansible ]]; then
    if [[ -d ~/src/mac-ansible/.git ]]; then
      echo "Install | mac-ansible | Pull"
      cd ~/src/mac-ansible && git pull
    fi
else
  echo "Install | mac-ansible | Clone"
  cd ~/src && git clone https://github.com/fruwe/mac-ansible.git
fi

cd ~/src/mac-ansible && ./bootstrap.sh
