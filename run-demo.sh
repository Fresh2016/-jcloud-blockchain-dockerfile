#!/bin/bash
NAME=${NAME:='verify'}
PORT=${PORT:='8081'}
IMG='jack6liu/verify'
TAG='1.7-0'
if [[ "$1" ]]; then
    NAME=$1
fi
if [[ "$2" ]]; then
    PORT=$2
fi

echo ">> run ${NAME} and listen on ${PORT} <<"
docker run --detach                         \
           --name ${NAME}                   \
           --hostname ${NAME}               \
           -p ${PORT}:8081                  \
           ${IMG}:${TAG}                    \
           bash
