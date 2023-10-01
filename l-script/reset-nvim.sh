#!/bin/bash

# exit when any command fails
set -e

# Goto current script folder
cd "$(dirname "$0")"

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim

