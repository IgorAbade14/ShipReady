# 1. Use a lightweight Nginx base image
FROM nginx:alpine

# 2. Copy the content from our local 'app' folder into the container
# Nginx serves files located in /usr/share/nginx/html
COPY ./app/index.html /usr/share/nginx/html/index.html

# 3. Expose port 80 (Standard Web Port)
EXPOSE 80