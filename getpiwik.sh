#!/bin/bash

if [ ! -f piwik_commit.txt ]; then
    echo "Cannot find piwik_commit.txt!"

    PIWIK_BRANCH=uitests
else
    read -a lines -d '\n' < piwik_commit.txt

    PIWIK_COMMIT="${lines[0]}"
    PIWIK_BRANCH="${lines[1]}"
fi

echo "Cloning branch $PIWIK_BRANCH..."

cd ..
git clone --depth=50 "--branch=$PIWIK_BRANCH" git://github.com/piwik/piwik.git piwik

if [ "$PIWIK_COMMIT" != "" ]; then
    echo "Checking out commit $PIWIK_COMMIT..."
    git checkout -qf "$PIWIK_COMMIT"
else
    echo "No commit to checkout."
fi

cd piwik
git submodule update --init --recursive

cd tests/PHPUnit/UI
git pull --rebase
cd ../../..