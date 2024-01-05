#!/bin/bash

exec gpg --batch --quiet --symmetric \
  --pinentry-mode=loopback --passphrase="${ARTIFACT_SECRET_KEY}" \
  --in tfplan.zip --out tfplan.enc
