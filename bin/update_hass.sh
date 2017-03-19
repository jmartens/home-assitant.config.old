#!/bin/bash
# Stop service
sudo systemctl stop home-assistant.service

# Update Home Assistant 
sudo -su hass
source /srv/hass/hass_venv/bin/activate
pip3 install --upgrade homeassistant
deactivate

# Start service
sudo systemctl start home-assistant.service