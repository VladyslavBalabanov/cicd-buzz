#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t vladyslav.balabanov:$TAG .
docker tag vladyslav.balabanov/cicd-buzz $DOCKER_USER/vladyslav.balabanov/cicd-buzz
docker push $DOCKER_USER/vladyslav.balabanov:$TAG