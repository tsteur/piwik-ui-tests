#!/bin/bash

if [ ! -f piwik_commit.txt ]; then
    PIWIK_COMMIT=uitests
else
    PIWIK_COMMIT=$(cat piwik_commit.txt)
fi

cd ..
git clone --depth=50 "--branch=$PIWIK_COMMIT" git://github.com/piwik/piwik.git piwik

cd piwik
git submodule update --init --recursive