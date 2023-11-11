#!/bin/bash

# exit when any command fails
set -e

# Goto current script folder
cd "$(dirname "$0")"

cd ..

rm -r ./*

git clone https://github.com/yoda31217/lena.git . && lena/l-script/setup-nvim.sh
