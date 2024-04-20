#!/bin/zsh

# exit when any command fails
set -e

# Goto current script folder
cd "$(dirname "$0")"

cd ..

cp zsh/lena-alias.zsh ~/.oh-my-zsh/custom

echo "Now you have to reload your terminal to apply changes."

