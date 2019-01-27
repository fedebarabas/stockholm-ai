#!/usr/bin/env bash
set -ex

# # Install docker and tmux
# sudo yum update -y
# sudo yum install docker tmux -y
# sudo service docker start
# sudo usermod -a -G docker ec2-user

: ${STOCKHOLM_AI_PORT:=80}

docker build --tag stockholm-ai .
docker run \
    --interactive \
    --tty \
    --env STOCKHOLM_AI_BRANCH \
    --env SLACK_APP_HOOK \
    --volume `pwd`/letsencrypt.private/:/etc/letsencrypt \
    --publish ${STOCKHOLM_AI_PORT}:8080 \
    stockholm-ai
