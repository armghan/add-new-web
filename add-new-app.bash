#!/bin/bash

sitename=$1

cp siteX.conf nginx-conf/$sitename.conf
sed -i "s/siteX/$sitename/g" nginx-conf/$sitename.conf

cp new-web-container-template new-container
sed -i "s/siteX/$sitename/g" new-container
cp .env-Example .env-$sitename
sed -i "s/siteX/$sitename/g" .env-$sitename
mkdir ENV/env-$sitename
cp .env-$sitename ENV/env-$sitename/.env-$sitename
cat new-container >> docker-compose.yml

rm -f new-container
rm -f .env-$sitename
docker-compose up -d
docker restart reverse-proxy
