#!/bin/sh
HOMEDIR=$HOME
USERNAME=$(whoami)

USE_SUDO=''
if [ $USERNAME != "root" ];
then
  USE_SUDO="sudo "
fi

# Are we on OSX and do we need homebrew?
if [[ `uname` == 'Darwin' ]];
then
	command -v brew > /dev/null 2>&1
	if [ $? -ne 0 ];
	then
    echo "Homebrew not found. Installing ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  # Do we need to install Ansible?
  command -v ansible > /dev/null 2>&1
  if [ $? -ne 0 ];
	then
		echo "Ansible not found. Installing ..."
    brew install ansible
	fi

# we are on Linux
else
	# Do we need to install Ansible?
	command -v ansible > /dev/null 2>&1
	if [ $? -ne 0 ];
	then
		echo "We need Ansible ..."
    # install ansible
    $USE_SUDO apt-add-repository ppa:ansible/ansible
    $USE_SUDO apt update
    $USE_SUDO apt install ansible -y
	fi
fi

ansible-playbook -u `whoami` -k playbook.yaml
