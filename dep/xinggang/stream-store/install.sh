#!/bin/bash
CWD=$(cd "$(dirname $0)";pwd)
#license
sudo mkdir -p /var/lic/apps-stream-store
sudo cp ${CWD}/lic/lic.lic /var/lic/apps-stream-store/
#nginx
sudo mkdir -p /var/opt/apps-stream-store/nginx/config
sudo mkdir -p /var/opt/apps-stream-store/nginx/logs
sudo cp ${CWD}/nginx.conf /var/opt/apps-stream-store/nginx/config/
#docker images
unzip -o ${CWD}/../../../docker-apps-stream-store.zip -d ${CWD}/
unzip -o ${CWD}/../../../nginx.zip -d ${CWD}/
sudo docker load -i ${CWD}/docker-apps-stream-store.tar
sudo docker load -i ${CWD}/nginx.tar