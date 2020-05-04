#!/usr/bin/env bash

env

if [ "${DROPBOX_ACCESS_TOKEN}" == "" ]; then
    echo "Error: please provide an DROPBOX_ACCESS_TOKEN env variable"
    exit 1
fi    

# Configure rclone
mkdir -p /root/.config/rclone/

cat <<EOF > /root/.config/rclone/rclone.conf
[mydropbox]
type = dropbox
token = {"access_token":"${DROPBOX_ACCESS_TOKEN}","token_type":"bearer","expiry":"0001-01-01T00:00:00Z"}
EOF

# Configure NGINX
cat <<EOF > /etc/nginx/conf.d/website.conf

server {
    listen 8000;
    root /mnt/dropbox/pageperso/;
    error_page 404 /404.html;
    location ~ "^/error-pages" {
             root   /mnt/dropbox/pageperso/;
             internal;
    }
}

server {
    listen 8001;
    root /mnt/dropbox/Apps/site44/dropbox.jonathanpastor.fr/;
    error_page 404 /404.html;
    location ~ "^/error-pages" {
             root   /mnt/dropbox/Apps/site44/dropbox.jonathanpastor.fr/;
             internal;
    }
}
EOF

sed -i "s/www-data/root/g" /etc/nginx/nginx.conf 
service nginx restart

mkdir /mnt/dropbox

rclone mount  mydropbox:/ /mnt/dropbox

exit 0
