#!/bin/bash

registry=${1:-wesparish}
imagename=${2:-$(basename $PWD)}

for dockerfile in $(find  -name Dockerfile); do
  versionvariant=$(dirname $dockerfile | sed -e 's|^./||g' -e 's|/|-|g')
  echo Building variant: $versionvariant
  echo docker build -t $registry/$versionvariant $(dirname $dockerfile)
  docker build -t $registry/$versionvariant $(dirname $dockerfile)
  echo docker push $registry/$versionvariant
  docker push $registry/$versionvariant
done
