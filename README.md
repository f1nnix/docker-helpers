# docker-helpers

Docker and docker-machine CLI shortcuts and helpers for Linux and macOS

## Install

Clone repo and add to `~/.basrc` or `~/.zshrc` line:

    source 'path-to-repo/docker-helpers.sh'

E.g. you cloned repo to `~/dev/docker-helpers`. So, add to `~/.bashrc` line:

    source '~/dev/docker-helpers/docker-helpers.sh'

## Usage

### docker-machine

* **dml** -- list all docker machines (hosts);
* **dms <machine-name>** -- shell to specified docker machine;
* **dme <machine-name>** -- env to specified machine, list volumes, images and ALL containers;
* **dmrc <machine-name>** -- regenerate certificated for specified machine.

### docker

* **dcl** -- list ALL containers for active (env'ed) machine;
* **dcb <container-id>** -- run interactive bash shell for specified container. After, don't forget to `exit`.
