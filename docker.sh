#!/bin/bash
build()
{
    docker build . -f docker/Dockerfile -t srg
}

shell()
{
    docker run --rm --user $(id -u):$(id -g) --name go-color-backend -it -v $(pwd):/app go-color-backend 
    # docker run --gpus all --rm -it -v $(pwd):/app -v $DATASET_DIRS:/dataset -v $DATA_DIRS:/data srg
}

if [[ $1 == "build" ]]; then
    build
elif [[ $1 == "shell" ]]; then
    shell 
fi