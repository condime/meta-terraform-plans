#!/bin/bash

exec gpg --batch --quiet --decrypt \
  --pinentry-mode=loopback --passphrase="${ARTIFACT_SECRET_KEY}" \
  --out tfplan.zip tfplan.enc
