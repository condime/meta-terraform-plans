#!/bin/bash

exec gpg --batch --quiet --symmetric \
  --pinentry-mode=loopback --passphrase="${ARTIFACT_SECRET_KEY}" \
  --output tfplan.enc tfplan.zip
