#!/bin/bash
# Purpose:
#       * bootstrap machine in order to prepare for ansible playbook run

set -e

# Download and install Command Line Tools if no developer tools exist
if [[ $(/usr/bin/gcc 2>&1) =~ "no developer tools were found" ]] || [[ ! -x /usr/bin/gcc ]]; then
    echo "Info     | Install     | xcode"
    xcode-select --install
fi

# Download and install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
    echo "Info     | Install     | homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Download and install Ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
    echo "Info     | Install     | Ansible"
    brew update
    brew install ansible
fi

# Modify the PATH
# This should be subsequently updated in shell settings
export PATH=/usr/local/bin:$PATH

if [[ -d .git ]]; then
    echo "Info     | mac-ansible | Pull"
    git pull
fi

# Use this if you use the vault
# if [[ ! -f ~/.ansible_vault_pass.py ]]; then
#     echo "Please save your vault password in ~/.ansible_vault_pass.py"
#     exit
# fi
#
# ansible-playbook local.yml --vault-password-file ~/.ansible_vault_pass.py

ansible-playbook local.yml --ask-become-pass
