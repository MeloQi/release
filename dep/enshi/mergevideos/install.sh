#!/bin/bash
CWD=$(cd "$(dirname $0)";pwd)
#license
sudo mkdir -p /var/lic/apps-mergevideos
sudo cp ${CWD}/lic/lic.lic /var/lic/apps-mergevideos/
#nginx
sudo mkdir -p /var/opt/apps-mergevideos/nginx/config
sudo mkdir -p /var/opt/apps-mergevideos/nginx/logs
sudo cp ${CWD}/nginx.conf /var/opt/apps-mergevideos/nginx/config/
#docker images
unzip -o ${CWD}/../../../docker-apps-mergevideos.zip -d ${CWD}/
unzip -o ${CWD}/../../../nginx.zip -d ${CWD}/
sudo docker load -i ${CWD}/docker-apps-mergevideos.tar
sudo docker load -i ${CWD}/nginx.tar