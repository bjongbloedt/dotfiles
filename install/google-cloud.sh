#!/usr/bin/env bash

# Install google-cloud-sdk
curl https://sdk.cloud.google.com | sh
exec -l $SHELL
gcloud init
