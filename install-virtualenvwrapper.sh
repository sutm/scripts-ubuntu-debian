#!/bin/bash

sudo apt-get install python3-pip python3-dev build-essential

sudo pip3 install virtualenv virtualenvwrapper

sudo pip3 install --upgrade pip

if [ -z ${WORKON_HOME+x} ];
then 
	# backup the .bashrc file
	cp ~/.bashrc ~/.bashrc-org

	printf '\n%s\n%s\n%s\n%s' '# virtualenv' 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3' 'export WORKON_HOME=~/virtualenvs' 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc

	source ~/.bashrc
	mkdir -p $WORKON_HOME
fi

