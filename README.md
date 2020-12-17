A simple nodejs webapp created using Ansible and Dockerfile

## Prerequisite

 - IAM user with programmatic access
 - key pair for instance access

## Features

 - Ansible
 - Dockerfile
 - Dockercontainer
 - nodejs
 - Ubuntu EC2

## ubuntu.yml

 1. Creates an Ubuntu EC2 instance
 2. Creates an Inventory for SSH access
 3. Update apt packages
 4. Install required packages for installation of Docker and nodejs
 5. Add  Docker repository
 6. Install Python Docker module using pip
 7. Add ubuntu user to docker group for non-root docker sessions
 8. Copying the docker files for building nodejs webapp image to `/home/ubuntu/`
 9. `.dockerignore` file in the same directory will prevent your local modules and debug logs from being copied onto your Docker image and possibly overwriting modules installed within your image
 10. Building nodejs webapp docker image
 11. Starting the nodejs webapp container on port `80`

## Dockerfile

`FROM node:15` ⇒ pulls image `node:15` from dockerhub as base and start a temporary container

`WORKDIR /usr/src/app` ⇒ change the working directory to `/usr/src/app` in the container

`COPY nodejs/package*.json ./`⇒ copies the files package.json and package-lock.json to the `WORKDIR`

`RUN npm install` ⇒ install npm package in the container

`COPY  nodejs/server.js` ⇒ copies server.js to `WORKDIR` 

`EXPOSE  80` ⇒ exposes container port 80

`CMD  [  "node",  "server.js"  ]` ⇒ executes `node server.js` when container is started


## server.js

A simple java script file to show "Hello World"

## variable.vars

Consists of the IAM access_key_id and secret_access_key
