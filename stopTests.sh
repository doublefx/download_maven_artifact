#!/usr/bin/env bash
molecule destroy
docker stop artifactory > null
sudo rm -rf /root/artifactory > null
echo removed container artifactory.
