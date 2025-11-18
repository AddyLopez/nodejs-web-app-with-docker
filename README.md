# nodejs-web-app-with-docker

## Description

A simple NodeJS and Express web app wrapped in a Docker container.

## Troubleshooting Planned Errors

This learning project included some planned errors to gain valuable experience in troubleshooting Docker. Those errors included:

- **_Summary:_** Using a bad base image.

  - **_Elaboration of problem:_** Trying to run Node when Node was not included in the base image (e.g. alpine) results in an error.
  - **_Solution:_** Include a new base image from Docker Hub which includes Node. (e.g. node14:alpine)

- **_Summary:_** Not copying over package.json file.

  - **_Elaboration of problem:_** The package.json file was not found, which prevented the command _npm install_ from running and installing dependencies. That's because the Docker container had no access to the other files inside the project's directory.
  - **_Solution:_** ## Write a command to copy files from current working directory into the current working directory inside the container.

- **_Summary:_** Lack of port forwarding.
  - **_Elaboration of problem:_** Since the browser cannot directly access the Docker container's port, the local port needs to be mapped to a port on the container to gain access.
  - **_Solution:_** Learn command for port mapping at runtime from Docker CLI. Understand that the number of the local port does not need to be identical to that of the Docker container.
