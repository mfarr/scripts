#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

cert_dir=/home/mike/Storage/server/cert
domain_name=juno.fawn-alpha.ts.net

cd $cert_dir
tailscale cert $domain_name
openssl pkcs12 -export -out cert.pfx -inkey juno.fawn-alpha.ts.net.key -in juno.fawn-alpha.ts.net.crt -passout file:passphrase.txt
chown mike:mike cert.pfx "${domain_name}.crt" "${domain_name}.key"
cp "${domain_name}.crt" ../config/syncthing/https-cert.pem
cp "${domain_name}.key" ../config/syncthing/https-key.pem
cd ..
docker-compose restart
