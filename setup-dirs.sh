#! /bin/bash

# written by D.Meder-Marouelli

cd /home-data

# mosquitto
mkdir -p config/mosquitto/conf.d
mkdir -p mosquitto/log
chown 1883:1883 config -R
chown 1883:1883 mosquitto -R

# grafana
mkdir plugins 
mkdir png 
chown 472:472 plugins
chown 472:472 png 

# prometheus
mkdir prometheus
chown 65534:65534 prometheus
