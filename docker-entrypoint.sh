#!/usr/bin/env bash

if [ -z "$PASSWORD" ]; then
    PASSWORD=1234
fi


x11vnc -storepasswd "$PASSWORD" ~/.vnc/passwd


exec "$@"
