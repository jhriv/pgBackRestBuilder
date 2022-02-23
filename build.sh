#!/bin/bash

set -e

image_name=pgbackrestbuilder
cid_file=.cid

options=(--env NO_INSTRUCTIONS=true)
if [ -n "$VERSION" ]; then
  options=("${options[@]}" --env VERSION="$VERSION")
fi

docker build -t "$image_name" .
docker run --cidfile .cid "${options[@]}" "$image_name"
docker cp "$(cat "$cid_file")":/pgbackrest .
echo "pgbackrest has been built and is located in $PWD"
rm "$cid_file"
