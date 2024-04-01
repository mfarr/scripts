#!/bin/bash
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

cert_dir=/home/mike/Storage/server/cert
domain_name=juno.fawn-alpha.ts.net
passphrase_file=passphrase.txt
syncthing_dir=../config/syncthing

cd $cert_dir
tailscale cert $domain_name
openssl pkcs12 -export -out cert.pfx -inkey "${domain_name}.key" -in "${domain_name}.crt" -passout file:$passphrase_file
chown mike:mike cert.pfx "${domain_name}.crt" "${domain_name}.key"
cp "${domain_name}.crt" "${syncthing_dir}/https-cert.pem"
cp "${domain_name}.key" "${syncthing_dir}/https-key.pem"
docker-compose restart
