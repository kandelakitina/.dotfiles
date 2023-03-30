# Install nix and source nix from Determinate Systems
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Force add nixpkgs channel to avoid errors
nix-channel --add https://nixos.org/channels/nixpkgs-unstable

# Update nix channels' list
nix-channel --update

# Run nix daemon
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# install packages
nix-env -iA \
  nixpkgs.zsh \           # a powerful shell interface
  nixpkgs.alacritty \     # GPU accelerated terminal emulator 
  nixpkgs.antibody \      # a fast and flexible shell plugin manager
  nixpkgs.git \           # distributed version control system
  nixpkgs.tmux \          # terminal multiplexer for managing multiple sessions
  nixpkgs.neovim \        # a modern, extensible text editor
  nixpkgs.helix \         # a post-modern text editor
  nixpkgs.stow \          # a symlink manager for organizing dotfiles
  nixpkgs.yarn \          # a fast and reliable JavaScript package manager
  nixpkgs.fzf \           # a general-purpose command-line fuzzy finder
  nixpkgs.ripgrep \       # a fast and efficient search tool
  nixpkgs.bat \           # a cat clone with syntax highlighting and Git integration
  nixpkgs.direnv \        # an environment switcher for the shell
  nixpkgs.gh \            # GitHub's official command line tool to login though web
  nixpkgs.lazygit \       # a simple terminal UI for Git commands
  nixpkgs.nodejs \        # a JavaScript runtime built on Chrome's V8 engine
  nixpkgs.gcc \           # GNU Compiler Collection (C, C++, Objective-C, Fortran)
  nixpkgs.fd \            # better find command
  nixpkgs.inotify-tools \ # allows to auto-stow when .dotfiles are changed

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

# Install alacritty themes switcher
npm i -g alacritty-themes

# Run inotify-tools to watch dotfiles
bash "./scripts/watch_dotfiles.sh"

# Login to github
gh auth login
