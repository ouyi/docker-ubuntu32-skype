#!/usr/bin/env bash
set -e

if (( $# < 2 )); then
    echo "Usage: $0 image_name container_name"
    exit 1
fi

image_name=${1:-"ouyi/ubuntu32-skype"}
container_name=${2:-"ubuntu32-skype"}

USER_UID=$(id -u)
USER_GID=$(id -g)

xhost localhost:$(whoami)
docker run -it --rm \
    --privileged \
    --env=USER_UID=$USER_UID \
    --env=USER_GID=$USER_GID \
    --env=DISPLAY=unix$DISPLAY \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
    --volume=/run/user/$USER_UID/pulse:/run/pulse:ro \
    --volume=/dev/video0:/dev/video0:rw \
    --name ${container_name} \
    ${image_name}
