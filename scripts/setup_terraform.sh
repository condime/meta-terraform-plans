#!/bin/bash
if command -v terraform 2> /dev/null; then
  terraform --version
else
  TERRAFORM_RELEASE_TEMP_DIR="$(mktemp -d)"
  TERRAFORM_RELEASE_BIN_DIR="${TF_TEMP_DIR}/$(uuidgen)"
  wget -P "${TERRAFORM_RELEASE_TEMP_DIR}" \
    "https://releases.hashicorp.com/terraform/${TERRAFORM_RELEASE}/terraform_${TERRAFORM_RELEASE}_linux_amd64.zip"

  mkdir -v "${TERRAFORM_RELEASE_BIN_DIR}"
  cd "${TERRAFORM_RELEASE_BIN_DIR}"
  unzip ../terraform_${TERRAFORM_RELEASE}_linux_amd64.zip
  export PATH="${TERRAFORM_RELEASE_BIN_DIR}:${PATH}"

  terraform --version
fi
