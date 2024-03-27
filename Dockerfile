# Use the official Nginx base image
FROM nginx:latest

# Copy a simple HTML file to the container
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
