## About

Dockerized Skype based on 32-bit Ubuntu (see also: https://github.com/ouyi/docker-ubuntu-precise-core-i386). The implementation is based on https://github.com/terlar/docker-skype-pulseaudio.

## Prerequisite

A working docker installation. Please refer to the [docker documentation](https://docs.docker.com/engine/installation/) for this.

To be able to run docker as normal user (i.e., without using sudo) as follows, a group called docker must exists and the user must be member of that group.

## Usage

1. Clone this repository and change to the directory:

  ```sh
    git clone https://github.com/ouyi/docker-ubuntu32-skype.git && cd docker-ubuntu32-skype
  ```

2. Build the container:

  ```sh
    docker build -t <image_name> .
  ```

3. Run the provided skype script:

  ```sh
    ./skype.sh <image_name> <container_name>
  ```

## Known issues

- If the host machine has a VPN connection, the Docker container may have problems accessing the Internet. Adding "--net=host" may work around the issue.
