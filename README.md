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


## Dockerfile log

    Sending build context to Docker daemon  17.92kB
    Step 1/7 : FROM node:15
    latest: Pulling from library/node
    22f9b9782fc3: Pull complete 
    2c75c9e56a8a: Pull complete 
    b31d19b99daa: Pull complete 
    e000cbf49b08: Pull complete 
    892def1a6f88: Pull complete 
    0581e893c9eb: Pull complete 
    0ad0885e5e6f: Pull complete 
    bdae7f78fe28: Pull complete 
    f328a27cd263: Pull complete 
    Digest: sha256:e3bc934b55a584843b234f1894fd9f3af47889b441ca6a16230e2d730fec3ae5
    Status: Downloaded newer image for node:15
     ---> bd4dba13afd5
    Step 2/7 : WORKDIR /usr/src/app
     ---> Running in 11724ad71308
    Removing intermediate container 11724ad71308
     ---> d7b75a70c03b
    Step 3/7 : COPY nodejs/package*.json ./
     ---> 7fb465693a71
    Step 4/7 : RUN npm install
     ---> Running in 49b5e6bf0d10
    
    added 50 packages, and audited 50 packages in 3s
    
    found 0 vulnerabilities
    Removing intermediate container 49b5e6bf0d10
     ---> 6feb7e0a5e5f
    Step 5/7 : COPY nodejs/server.js .
     ---> 6f2e4a8fc105
    Step 6/7 : EXPOSE 80
     ---> Running in 1640f5f3b5a3
    Removing intermediate container 1640f5f3b5a3
     ---> 4efd6b32f3c9
    Step 7/7 : CMD [ "node", "server.js" ]
     ---> Running in ea256d8ed0fd
    Removing intermediate container ea256d8ed0fd
     ---> 583da4223a0a
    Successfully built 583da4223a0a
    Successfully tagged roshanjoseph23/nodejsapp:v3 


## server.js

A simple java script file to show "Hello World"

## variable.vars

Consists of the IAM access_key_id and secret_access_key
