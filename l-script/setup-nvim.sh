#!/bin/bash

# exit when any command fails
set -e

# Goto current script folder
cd "$(dirname "$0")"

cd ..

git submodule init
git submodule update

#ln -s "$(pwd)/l-config/nvim/after" l-nvchad-config/nvim/after
#ln -s "$(pwd)/l-config/nvim/lua/custom" l-nvchad-config/nvim/lua/custom
#
#./l-script/reset-nvim.sh
#
#ln -s "$(pwd)/l-nvchad-config/nvim" ~/.config/nvim

