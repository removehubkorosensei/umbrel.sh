# Umbrel in docker

Simple docker container and scripts to run Umbrel itself inside a docker
container, so it doesn't require the host machine to run on a Debian based OS.

## Build

Run `./build.sh` to build the container which will execute the Umbrel code
stored on the docker host.

## Install

Run `./install.sh` to download the Umbrel code to your host machine.

- Set `INSTALL_PATH` to change the download location (Default: `$PWD/data`).

## Start

Run `./run.sh` to launch Umbrel.

- Set `INSTALL_PATH` to the location of the Umbrel code (Default: `$PWD/data`).
- Set `NGINX_PORT` to change the port where you can access the dashboard
  (Default: 8090)
- Set `DOCKER_BINARY` to change the docker executable location (Default:
  `$(which docker)`).

All `docker run` arguments are supported, but arguments with values have to use
the equal sign notation (e.g. `--name=Umbrel`).

## Run commands

You can pass the path and args for any executable inside the Umbrel code folder,
e.g. run `./run.sh scripts/app install <app-id>` to install an app from the cli.
