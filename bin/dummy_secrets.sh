#!/bin/bash

# Generate secret for all requried entries to prevent failure
secrets=$(grep -hRP \!secret {*.yaml,*/*.yaml} | \
    sed -re 's/\s*\w+\:\s+\!secret\s+(\w+)/\1/' | \
    sort -u )
for secret in $secrets
do
    case $secret in
        longitude | latitude | *long | *lat | home_elevation)
            echo "$secret: 0" | tee -a $TRAVIS_BUILD_DIR/secrets.yaml;;
        timezone)
            echo "$secret: Europe/Amsterdam" | tee -a $TRAVIS_BUILD_DIR/secrets.yaml;;
        *)
            echo "$secret: dummy" | tee -a $TRAVIS_BUILD_DIR/secrets.yaml;;
    esac
done

# Create certificate requriements
touch "ssl_key.pem"
touch "ssl_cert.pem"
