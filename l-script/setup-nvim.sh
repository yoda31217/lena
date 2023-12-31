#!/bin/bash

# exit when any command fails
set -e

# Goto current script folder
cd "$(dirname "$0")"

cd ..

git submodule init
git submodule update

ln -s "$(pwd)/l-config/nvim/after" l-dependencies/nvchad/after
ln -s "$(pwd)/l-config/nvim/lua/custom" l-dependencies/nvchad/lua/custom
ln -s "$(pwd)/l-dependencies/microsoft/java-debug/com.microsoft.java.debug.plugin/target" l-dependencies/nvchad/java-debug

# We cannot UNDO changes below
./l-script/reset-nvim.sh
ln -s "$(pwd)/l-dependencies/nvchad" ~/.config/nvim

cd l-dependencies/microsoft/java-debug
./mvnw clean install
cd ../../..

