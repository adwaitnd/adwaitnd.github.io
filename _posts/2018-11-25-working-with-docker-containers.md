---
layout: single
title: Working with Docker containers
date: 2018-11-25 17:46 -0500
---

This is a docker cookbook of sorts.

# Launching a GUI application with docker
My final object is to run the `gnuradio-companion` GUI through a docker container.

Why bother?  
Because GNURadio loves to muck up the entire system regardless of the OS used. It also doesn't like to live in non-standard directories (most tools then fail to run) which leaves out the option os a parallel install. So containerization is probably the right option :-/

[Running GUI apps with Docker - Somatorio (Nov 2018)](http://somatorio.org/en/post/running-gui-apps-with-docker/)

[Docker Containers on the Desktop - Jess Frazelle (Nov 2018)](https://blog.jessfraz.com/post/docker-containers-on-the-desktop/)

Here was my timeline

1. Check if there is a `gnuradio` docker image available.  
I checked available images with `docker search gnuradio` and found `marcelmaatkamp/gnuradio` to be a promising option
1.

## What finally worked

    docker run -e DISPLAY=host.docker.internal:0 --entrypoint gnuradio-companion -it marcelmaatkamp/gnuradio

*Notes:*

- The -t flag is not necessarily required but gives GNURadio debugging outputs

## Check which docker images are installed
    docker images

## Find the ID or names of currently running containers
    docker ps

`docker -s -qa` will provide the names of containers without additional info. Useful to combine with other docker commands like `docker stop` and `docker rm`

## Stop containers
    docker stop <container name or ID>

Convenient way to stop all running containers
    docker stop $(docker ps -qa)

## Remove containers
Note: only stopped containers can be removed.  

    docker rm <container name or ID>

Convenient way to remove all stopped container
    docker rm $(docker ps -qa)

## Remove the downloaded docker image
Note: Images can only be removed if there are no running or stopped containers using this image

    docker rmi <image name>

## Trying to launch a simple GUI image called `gns3/xeyes`

Before we can run a docker GUI, we need to add localhost to allowable connection list for the X window server.

    xhost + 127.0.0.1
Or
    xhost + localhost

Then run the docker container (using the default script)
    docker run -e DISPLAY=host.docker.internal:0 gns3/xeyes

What is happening here?
`host.docker.internal:0` is the IP address of the computer (and port) where the X server is running

How to explore the contents of a docker container?
docker run --rm -it --entrypoint=/bin/bash name-of-image

The rm flag automatically removes the container after it exits

## Taking a snapshot of a container

    # find ID of your running container:
    docker ps -a

    # create image (snapshot) from container filesystem
        docker commit 12345678904b5 mysnapshot

    # explore this filesystem using bash (for example)
        docker run -t -i mysnapshot /bin/bash

    # remove snapshot after we’re done
        docker rmi mysnapshot


# docker exec
Note: exec is used to run another command in an already running container.

    docker exec -it <running container name or ID> bash

[Docker exec - CLI Reference (Nov 2018)](https://docs.docker.com/engine/reference/commandline/exec/)


