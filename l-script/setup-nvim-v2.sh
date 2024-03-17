#!/bin/bash

# exit when any command fails
set -e

# Goto current script folder
cd "$(dirname "$0")"

cd ..

./l-script/reset-nvim.sh
ln -s "$(pwd)/v2" ~/.config/nvim

