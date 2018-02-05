#!/bin/bash
# bash script for running a docker image in a nice-ish way
# version 0.5
#
# CHANGELOG
#
# 0.5 warn the user about xhost
# 0.4 ask whether to create container
# 0.3 use variables instead of magic words
# 0.2 add feature to open a new shell when container is already running

if [[ $# != 1 ]]; then
	echo Usage: $0 CONTAINER
	exit 1
fi

IMAGE=
CONTAINER="$1"

# check if the container already exists and get its state
state=$(docker inspect --format "{{.State.Running}}" $CONTAINER 2> /dev/null)
if [ $? != 0 ]; then
	state="not-found"
fi

# check that an image exists
if [[ "$state" == "not-found" ]] ; then
	echo "There is no docker container named $CONTAINER"
	mapfile -t images < <(docker image ls --format {{.Repository}}:{{.Tag}} | grep $CONTAINER)
	if [[ ${#images[@]} == 1 ]]; then
		read -r -p "Would you like to create a container from the image ${images[0]}? [y/N] " response
		if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
			IMAGE=${images[0]}
		else
			exit 1
		fi
	fi
fi

# we assume the user wants to use X programs
# so we check the status of xhost for them
if (xhost | grep -q enabled); then
	echo Warning: xhost access control is enabled
	echo 'If you want X access you might want to run `xhost +` on the host'
fi


if [[ "$state" == "not-found" ]]; then
	# if it doesn't exist create the container
	# Run docker with all the right settings! 
	docker run -it \
		-v /etc/localtime:/etc/localtime:ro \
		--device /dev/dri \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix$DISPLAY \
		--name $CONTAINER \
		--hostname $CONTAINER \
		$IMAGE
elif [[ "$state" == "true" ]]; then
	# if it exists and is running
	# create a new bash session
	docker exec -it \
		$CONTAINER \
		bash
elif [[ "$state" == "false" ]]; then
	# start the container
	docker start -i $CONTAINER
fi

