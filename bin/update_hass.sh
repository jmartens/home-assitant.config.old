#!/bin/bash

#Stop HA
service hass-daemon stop

source /srv/hass/hass_venv/bin/activate
pip3 install -U homeassistant

service hass-daemon start
