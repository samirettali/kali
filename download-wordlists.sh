#!/usr/bin/env bash

cd ${HOME}
git clone https://github.com/danielmiessler/SecLists
aws s3 sync s3://assetnote-wordlists/data/ ./assetnote-wordlists --no-sign-request
