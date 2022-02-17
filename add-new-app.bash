#!/bin/bash

sitename=$1
containername=$2

cp siteX.conf nginx-conf/$sitename.conf
sed -i "s/siteX/$sitename/g" nginx-conf/$sitename.conf

cp new-web-container-template new-container
sed -i "s/siteX/$sitename/g" new-container
sed -i "s#IMAGE#$containername#g" new-container
cat new-container >> docker-compose.yml

rm -f new-container

docker-compose up -d
docker restart reverse-proxy
