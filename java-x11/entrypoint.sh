#!/bin/bash

if [ ! $LOCAL_USER_ID ]; then
    echo "Please set LOCAL_USER_ID environment variable"
    exit
fi

useradd --shell /bin/bash -u $LOCAL_USER_ID -o -c "" -m user
export HOME=/home/user

ln -s /usr/local/maven-cache/.m2 /home/user/.m2

/usr/local/bin/gosu user /usr/bin/Xvfb :1 -screen 0 1024x768x16 >/dev/null 2>&1 &

exec /usr/local/bin/gosu user "$@"
