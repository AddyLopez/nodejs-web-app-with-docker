# nodejs-web-app-with-docker

## Description

A simple NodeJS and Express web app wrapped in a Docker container.

## Technical Knowledge of Docker

After developing a high-level understanding of the problems Docker was designed to solve and of Docker's core concepts, such images and containers, I learned how to apply that knowledge in a practical setting by building this simple application. I drew from Docker Hub's library of build images, and I practiced building, running, and stopping the container using the Docker CLI. In the process, I gained experiece troubleshooting various problems outlined below. By closely examining the code produced by the Docker CLI after running different commands, I deepended my knowledge of how Docker works under the hood. I learned how to take advantage of Docker's caching to efficiently avoid unnecessary builds and how to execute port mapping to run the application in the browser. I also picked up best practices for integrating Docker's isolated container with the rest of my project's files.

## Troubleshooting Planned Errors

This learning project included some planned errors to gain valuable experience in troubleshooting Docker. Those errors included:

1. **Summary:** Using a bad base image.

- **Elaboration of problem:** Trying to run Node when Node was not included in the base image (e.g. alpine) results in an error.
- **Solution:** Include a new base image from Docker Hub which includes Node. (e.g. node14:alpine)

2. **Summary:** Not copying over package.json file.

- **Elaboration of problem:** The package.json file was not found, which prevented the command _npm install_ from running and installing dependencies. That's because the Docker container had no access to the other files inside the project's directory.
- **Solution:** Write a command to copy files from current working directory into the current working directory inside the container.

3. **Summary:** Lack of port forwarding.

- **Elaboration of problem:** Since the browser cannot directly access the Docker container's port, the local port needs to be mapped to a port on the container to gain access.
- **Solution:** Learn command for port mapping at runtime from Docker CLI. Understand that the number of the local port does not need to be identical to that of the Docker container.

4. **Summary:** Not good practice to copy files and dependencies directly into container's root directory.

- **Elaboration of problem:** Copying files into container's root directory might cause existing files to be overwritten accidentally within the container if there are conflicts between new files or folders and the default folder system.
- **Solution:** Instead, copy new files into a nested directory. Use the instruction WORKDIR which is designed to solve this problem. Any following commands will be executed relative to that folder (or path) in the container.

5. **Summary:** Unnecessary rebuilds.

- **Elaboration of problem:** Unnecessary and time-consuming rebuilds occur when commands are inefficiently sequenced in the Dockerfile and don't make good use of Docker's in-built caching. For example, if a change is made only in index.js, it is unnecessary and inefficient for the Docker CLI to run npm install.
- **Solution:** Mind the sequence of instructions declared in Dockerfile to avoid unnecessary rebuilds and to take advantage of Docker's in-built caching. That way, no computing resources will be spent running commands which are not immediately relevant.
