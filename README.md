# icinga2 docker containers

This repository contains a bunch of Dockerfiles to run icinga2. There are
already a lot of icinga2-docker-images, but this one (more precisely this
collection) of dockerfiles/docker-images follow the more docker-like aproach with one process
per container, and multiple containers orchestrated to represent a service.

Thanks to [docker-compose][docker-compose] providing a reusable way to
orchestrate docker-containers (instead of some very long hand-crafted *docker run commands*) it's now convinient to follow the recommended [docker-way][docker-best-pratice-process].

## Prerequisites

Obviously, you'll need **docker** and **docker-compose**.

## Building the image

Also the images are available via docker registry, you may build them locally.
For convinience ```make``` will call *docker build* with the required flags to create the images with the correct names locally.

### Sidenote

Yes, I know docker-compose can also generate images. But this way we can use the same *docker-compose.yml* file both for development and production.

## Usage

You'll might want to adjust *docker-compose.yml* to your needs. Then simply run

    docker-compose up -d

in this very directory.


# Implementation details

The icinga images are based on centos, as that's what icinga-developers seem to prefer as distribution looking at the official [Vagrantfile][icinga-vagrant], [Dockerfile][icinga-offical-docker] and the  [icinga-ansible-playbooks][icinga-ansible-playbook].

## icinga2 core

Runs the icinga2 daemon executing checks etc.

## icinga2 web

Webfrontend built using php. Webserver used in this image is *apache* with *mod_php*.
(Yeah, it's not as cool as *nginx*, but runs a single process).

## Database

Currently *mariadb*. Again this seems to be icinga's preferred choice. Maybe later I'll switch this to postgresql.

[docker-compose]: https://docs.docker.com/compose/
[docker-best-pratice-process]: https://docs.docker.com/articles/dockerfile_best-practices/#run-only-one-process-per-container
[icinga-vagrant]: https://github.com/Icinga/icinga-vagrant/blob/master/icinga2x/Vagrantfile
[icinga-offical-docker]: https://github.com/Icinga/docker-icinga2/blob/master/Dockerfile
[icinga-ansible-playbook]: https://github.com/icinga/icinga2-ansible
[library/nginx]: https://registry.hub.docker.com/_/nginx/
