#!/bin/bash

if [ -d "Codeception" ]; then
    cd Codeception
    git fetch origin master
    git reset --hard FETCH_HEAD
    git clean -df
    cd ..
else
    git clone https://github.com/Codeception/Codeception.git
fi

cd Codeception
git fetch --tags --force
TAG=`git tag | sort | tail -n 1| sed ':a;N;$!ba;s/\n/ /g'`
git checkout tags/$TAG
