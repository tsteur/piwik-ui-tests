#!/bin/bash

if [ ! -f piwik_commit.txt ]; then
    PIWIK_BRANCH=uitests
else
    read -a lines -d '\n' < piwik_commit.txt

    PIWIK_COMMIT="${lines[0]}"
    PIWIK_BRANCH="${lines[1]}"
fi

cd ..
git clone --depth=50 "--branch=$PIWIK_BRANCH" git://github.com/piwik/piwik.git piwik

if [ "$PIWIK_COMMIT" != "" ]; then
    git checkout -qf "$PIWIK_COMMIT"
fi

cd piwik
git submodule update --init --recursive