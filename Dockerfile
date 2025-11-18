# Specify a base image
FROM node:14-alpine

## Make commands that follow will be executed relative to this folder instead of in container's root directory
WORKDIR /usr/app

# Install some dependencies
## Copy only package.json from current working directory into current working directory of the container. That way npm install won't run during the build process unless there is a change to package.json
COPY ./package.json ./
RUN npm install
## Now copy everything else from current working directory into the current working directory inside the container
COPY ./ ./

# Default command
CMD ["npm", "start"]