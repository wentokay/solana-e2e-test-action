#!/bin/sh -l

export DISPLAY=:99.0
export PUPPETEER_EXEC_PATH="chromium"

solana-test-validator > /dev/null 2>&1 &
echo "solana-test-validator started"

# https://github.com/peterdanis/electron-puppeteer-demo/issues/171
cmd="xvfb-run $1"
echo "Running '$cmd'"
if $cmd; then
    echo "Successfully ran '$cmd'"
else
    exit_code=$?
    echo "Failure running '$cmd', exited with $exit_code"
    exit $exit_code
fi
