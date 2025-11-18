# Specify a base image
FROM node:14-alpine

# Install some dependencies
## Copy files from current working directory into the current working directory inside the container
COPY ./ ./
RUN npm install

# Default command
CMD ["npm", "start"]