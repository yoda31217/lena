#!/bin/bash

# exit when any command fails
set -e

# Goto current script folder
cd "$(dirname "$0")"

# ./reset-nvim.sh

rm -rf ../l-nvchad-config/nvim
git clone https://github.com/NvChad/NvChad ../l-nvchad-config/nvim --depth 1

ln -s "$(pwd)/../l-config/nvim/lua/custom" ../l-nvchad-config/nvim/lua/custom


