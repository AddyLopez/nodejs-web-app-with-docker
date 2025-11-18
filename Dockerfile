# Specify a base image
FROM node:14-alpine

## Make commands that follow will be executed relative to this folder instead of in container's root directory
WORKDIR /usr/app

# Install some dependencies
## Copy files from current working directory into the current working directory inside the container
COPY ./ ./
RUN npm install

# Default command
CMD ["npm", "start"]