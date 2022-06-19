#!/bin/sh -l

Xvfb -ac :99 -screen 0 1280x1024x16 > /dev/null 2>&1 &

export DISPLAY=:99.0
export PUPPETEER_EXEC_PATH="chromium"

solana-test-validator > /dev/null 2>&1 &
echo "solana-test-validator started"

cmd=$1
echo "Running '$cmd'"
if $cmd; then
    echo "Successfully ran '$cmd'"
else
    exit_code=$?
    echo "Failure running '$cmd', exited with $exit_code"
    exit $exit_code
fi
