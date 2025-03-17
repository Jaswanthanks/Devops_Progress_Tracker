


sudo yum update -y
sudo yum install -y nginx git

sudo systemctl start nginx
sudo systemctl enable nginx

sudo git clone https://github.com/Jaswanthanks/Udemy_Clone.git /var/www/html


sudo chown -R nginx:nginx /var/www/html
sudo chmod -R 755 /var/www/html


sudo rm -f /etc/nginx/nginx.conf


cat <<EOF | sudo tee /etc/nginx/nginx.conf
events {
    worker_connections 1024;
}

http {
    include /etc/nginx/mime.types;
    server {
        listen 80;
        server_name _;

        root /var/www/html;
        index index.html index.htm;

        location / {
            try_files \$uri \$uri/ =404;
        }
    }
}
EOF


sudo systemctl restart nginx
