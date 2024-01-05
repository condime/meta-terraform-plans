#!/bin/bash

# This file was encrypted using the following command:
#   $ gpg --symmetric --cipher-algo AES256 .secrets/private_key.pem

exec gpg --batch --quiet --decrypt --passphrase="${PRIVATE_KEY_PASSWORD}" \
  --output .secrets/private_key.pem .secrets/private_key.pem.gpg
