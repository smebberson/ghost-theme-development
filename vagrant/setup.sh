#!/usr/bin/env bash

if [ ! -e /etc/vagrant/setup ]
then

	echo ">>> setting up virtual machine"

	# alias the new-theme script
	if [ ! -e /usr/local/bin/new-theme ]; then
		ln -s /vagrant/vagrant/scripts/new-theme /usr/local/bin/new-theme
	fi

	# alias the ghost script
	if [ ! -e /usr/local/bin/ghost ]; then
		ln -s /vagrant/vagrant/scripts/ghost /usr/local/bin/ghost
	fi

	echo ">>> virtual machine has been setup and is ready to go'"

	touch /etc/vagrant/setup

else

	echo ">>> virtual machine has already been setup"

fi
