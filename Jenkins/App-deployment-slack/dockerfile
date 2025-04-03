FROM nginx:apline

RUN mkdir -p /var/cache/nginx/client_temp && \
    chmod -R 777 /var/cache/nginx

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY . . 

EXPOSE 80

CMD ["nginx" , "-g" , "daemon off;"]