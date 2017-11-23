#!/bin/sh

git fetch --prune

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")


if [ $LOCAL != $REMOTE ]; then
   # echo "Update available and downloading..."
    npm stop && git reset --hard && git clean -dfx && git pull && npm install && npm start &
fi
