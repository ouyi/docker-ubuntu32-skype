## About

Dockerized Skype based on 32-bit Ubuntu (see also: https://github.com/ouyi/docker-ubuntu-precise-core-i386). The implementation is based on https://github.com/terlar/docker-skype-pulseaudio.

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
