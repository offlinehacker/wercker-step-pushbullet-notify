#!/bin/sh

validate_params() {
    if [ ! -n "$WERCKER_PUSHBULLET_NOTIFY_ACCESS_TOKEN" ]
    then
        fail "missing access token, please check your wercker.yml"
    fi

    if [ ! -n "$WERCKER_PUSHBULLET_NOTIFY_TITLE" ]
    then
        fail "missing title, please check your wercker.yml"
    fi

    if [ ! -n "$WERCKER_PUSHBULLET_NOTIFY_BODY" ]
    then
        fail "missing body, please check your wercker.yml"
    fi
}

validate_params

curl -u ${WERCKER_PUSHBULLET_NOTIFY_ACCESS_TOKEN}: \
    -d type=note \
    -d title=$WERCKER_PUSHBULLET_NOTIFY_TITLE \
    -d body=$WERCKER_PUSHBULLET_NOTIFY_BODY \
    https://api.pushbullet.com/v2/pushes
