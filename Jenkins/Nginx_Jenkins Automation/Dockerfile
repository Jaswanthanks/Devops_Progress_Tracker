# Use Nginx as the base image to serve static files
FROM nginx:alpine

# Ensure permissions for /var/cache/nginx (required for Nginx on some systems)
RUN mkdir -p /var/cache/nginx/client_temp && \
    chmod -R 777 /var/cache/nginx

# Set the working directory to Nginx’s default static files directory
WORKDIR /usr/share/nginx/html

# Remove default Nginx static files
RUN rm -rf ./*

# Copy all frontend files
COPY . . 

# Expose port 80 for serving the application
EXPOSE 80

# Start the Nginx server
CMD ["nginx" , "-g" , "daemon off;"]