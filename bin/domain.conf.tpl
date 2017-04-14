server {
    listen 443;
    listen [::]:443;
    ssl    on;
    ssl_certificate    /etc/letsencrypt/live/[[domain]]/fullchain.pem;
    ssl_certificate_key    /etc/letsencrypt/live/[[domain]]/privkey.pem;
    server_name [[domain]];
    return 301 $scheme://www.$host$request_uri;
}