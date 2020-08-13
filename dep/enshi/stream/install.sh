#!/bin/bash
CWD=$(cd "$(dirname $0)";pwd)
#license
sudo mkdir -p /var/lic/apps-stream
sudo cp ${CWD}/lic/lic.lic /var/lic/apps-stream/
#images
unzip -o ${CWD}/../../../docker-apps-stream.zip -d ${CWD}/
sudo docker load -i ${CWD}/docker-apps-stream.tar