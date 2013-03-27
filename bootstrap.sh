#!/usr/bin/env bash

apt-get update
apt-get install curl -y
\curl -L https://get.rvm.io | bash -s stable --autolibs=enabled
rvm reload
rvm install 1.9.3
