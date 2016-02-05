#!/usr/bin/env bash

if [ ! -e /etc/vagrant/ghost ]
then

	echo ">>> setting up ghost"

	# Create the directory for ghost if it doesn't already exist
	mkdir -p /var/www/ghost

	# Empty the dir if it already existed
	rm -rf /var/www/ghost/*

	# Download ghost
	cd /var/www/ghost
	curl -sSL https://ghost.org/zip/ghost-latest.zip -o ghost.zip
	unzip -uo ghost.zip -d /var/www/ghost
	rm -r ghost.zip

	# Install ghost
	npm install --production

	# Set up config.js
	# Edit config.js to allow connections from outside the VM
    cp config.example.js config.js
    sed -i "s/127.0.0.1/0.0.0.0/g" ./config.js

	# Everything should be run as vagrant user from here on in
	chown -Rf vagrant:vagrant /var/www/ghost

	# only run once
	touch /etc/vagrant/ghost

else

	echo ">>> ghost already setup..."

fi
