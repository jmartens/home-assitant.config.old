#!/bin/bash
# Stop service
sudo systemctl stop home-assistant.service

# Update Home Assistant 
sudo -u hass `source /srv/hass/hass_venv/bin/activate 2>&1 && \
    pip3 install --upgrade homeassistant 2>&1 && \  source
    /srv/hass/hass_venv/bin/deactivate 2>&1 | \
    tee /home/hass/.homeassistant/hass-update.log`

# Start service
sudo systemctl start home-assistant.service