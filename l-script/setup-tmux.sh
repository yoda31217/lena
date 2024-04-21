#!/bin/zsh

# exit when any command fails
set -e

# Goto current script folder
cd "$(dirname "$0")"

cd ..

cp tmux/.tmux.conf ~

echo "tmux configuration file copied to user directory"

