#!/bin/sh

if [ ! -d "~/.npm-global" ]; then
  mkdir ~/.npm-global
fi

npm config set prefix '~/.npm-global'