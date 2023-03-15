# Install nix and source nix from Determinate Systems
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# install packages
nix-env -iA \
  nixpkgs.zsh \
  nixpkgs.antibody \
  nixpkgs.git \
  nixpkgs.tmux \
  nixpkgs.helix \
  nixpkgs.stow \
  nixpkgs.yarn \
  nixpkgs.fzf \
  nixpkgs.ripgrep \
  nixpkgs.bat \
  nixpkgs.direnv \

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
