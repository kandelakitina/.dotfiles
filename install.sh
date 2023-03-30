# Install nix and source nix from Determinate Systems
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Force add nixpkgs channel to avoid errors
nix-channel --add https://nixos.org/channels/nixpkgs-unstable

# Update nix channels' list
nix-channel --update

# Run nix daemon
bash /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# install packages
nix-env -iA \
  nixpkgs.zsh \
  nixpkgs.alacritty \
  nixpkgs.antibody \
  nixpkgs.git \
  nixpkgs.tmux \
  nixpkgs.neovim \
  nixpkgs.helix \
  nixpkgs.stow \
  nixpkgs.yarn \
  nixpkgs.fzf \
  nixpkgs.ripgrep \
  nixpkgs.bat \
  nixpkgs.direnv \
  nixpkgs.gh \
  nixpkgs.lazygit \
  nixpkgs.nodejs \
  nixpkgs.gcc \
  nixpkgs.fd \
  nixpkgs.inotify-tools \

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

# Run inotify-tools to watch dotfiles
bash ~/.dotfiles/scripts/watch_dotfiles.sh

# Install alacritty themes switcher
npx alacritty-themes

# Login to github
gh auth login
