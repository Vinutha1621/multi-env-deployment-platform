# Use the official Nginx image
FROM nginx:1.27-alpine

# Remove the default Nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy our application
COPY . /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
