#!/bin/bash

# Install nix and source nix from Determinate Systems
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Force add nixpkgs channel to avoid errors
nix-channel --add https://nixos.org/channels/nixpkgs-unstable

# Update nix channels' list
nix-channel --update

# Run nix daemon
bash /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# install packages via nix-env -iA
packages=(
  alacritty
  antibody
  bat
  direnv
  fd
  fzf
  gcc
  gh
  git
  helix
  inotify-tools
  lazygit
  neovim
  nodejs
  ripgrep
  stow
  tmux
  yarn
  zsh
)

for pkg in "${packages[@]}"; do
  nix-env -iA nixpkgs.$pkg
done

# Run script that watches and auto-stows every folder in .dotfiles/ 
bash ~/.dotfiles/scripts/watch_dotfiles.sh

# stow everything
# stow zsh
# stow git
# stow nvim
# stow helix
# stow alacritty

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install nerd fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Ubuntu Mono Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete.ttf

# Install alacritty themes switcher (use `at` in CLI to change)
npx alacritty-themes

# Login to github
gh auth login
