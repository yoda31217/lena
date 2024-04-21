#!/bin/bash

# exit when any command fails
set -e

# Goto current script folder
cd "$(dirname "$0")"

session='lena'
tmux new-session -d -s $session

tmux rename-window -t $session:0 'zsh'
tmux send-keys     -t $session:0 'ls -ahl' C-m

tmux new-window    -t $session:1 -n 'editor'
tmux send-keys     -t $session:1 'lena' C-m

