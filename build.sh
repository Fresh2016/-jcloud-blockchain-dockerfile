#!/bin/bash
IMG='jack6liu/verify'
TAG='1.7-0'

PUSH=${PUSH:='only'}
if [[ $1 ]]; then
    PUSH=$1
fi

build() {
    echo ">> building ${IMG}:${TAG} <<"
    docker build . -t ${IMG}:${TAG}
    echo ">> tagging ${IMG}:latest <<"
    docker tag ${IMG}:${TAG} ${IMG}:latest
}

push() {
    echo ">> pushing ${IMG}:${TAG} <<"
    docker push ${IMG}:${TAG}
    echo ">> pushing ${IMG}:latest <<"
    docker push ${IMG}:latest
}

case ${PUSH} in
    n|no)
        push
        ;;
    y|yes)
        build
        push
        ;;
    o|only)
        build
        ;;
    *)
        echo "Only 1 options accept, used for push image to docker hub"
        echo "Avalible options: o|only, y|yes, n|no"
        echo "    - o|only, docker build and tag to latest, this is DEFAULT"
        echo "    - y|yes,  docker build and tag to latest, then push to docker hub"
        echo "    - n|no,   only push to docker hub"
        ;;
esac

