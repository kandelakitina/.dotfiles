#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

# Function to run stow for all subdirectories in the .dotfiles folder
run_stow() {
  for dir in $(find "$DOTFILES_DIR" -maxdepth 1 -mindepth 1 -type d); do
    (cd "$DOTFILES_DIR" && stow --restow "$(basename "$dir")")
  done
}

# Watch for changes in the .dotfiles folder and run stow
while inotifywait -r -e modify,create,delete,move "$DOTFILES_DIR"; do
  run_stow
done
