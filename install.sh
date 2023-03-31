#!/bin/bash


# =================
# Nix Package manager
# =================

# Check if nix is installed
if ! command -v nix &> /dev/null; then
  # Install nix and source nix from Determinate Systems
  echo "Nix package manager not found. Installing..."
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

  # Force add nixpkgs channel to avoid errors
  nix-channel --add https://nixos.org/channels/nixpkgs-unstable

  # Update nix channels' list
  nix-channel --update

  # Run nix daemon
  bash /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
else
  echo "Nix package manager is already installed."
fi


# =================
# Nix packages
# =================

# Array of rainbow colors (in ANSI escape codes)
rainbow_colors=(
  "\033[38;5;196m" # Red
  "\033[38;5;202m" # Orange
  "\033[38;5;226m" # Yellow
  "\033[38;5;46m"  # Green
  "\033[38;5;21m"  # Blue
  "\033[38;5;93m"  # Indigo
  "\033[38;5;201m" # Violet
)

color_index=0

# Install packages via nix-env -iA, but only if they are not already installed
packages=(
  alacritty
  antibody
  bat
  direnv
  fd
  fish
  fzf
  fff
  gcc-wrapper
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
)

# Installing packages if they are not installed
echo "Installing Nix packages..."

for pkg in "${packages[@]}"; do

  # Check if the package is already installed
  color=${rainbow_colors[$color_index]}
  if nix-env -q "$pkg" > /dev/null; then
    echo -e "${color}$pkg\033[0m is already installed."
  else
    echo -e "Installing ${color}$pkg\033[0m"
    nix-env -iA nixpkgs.$pkg
  fi

  # Update the color index, cycling through the rainbow colors
  color_index=$(( (color_index + 1) % ${#rainbow_colors[@]} ))
done


# =================
# Stow
# =================

# Run script that watches and auto-stows every folder in .dotfiles/ 
echo "Running script to automatically stow config files"
nohup bash ~/.dotfiles/scripts/watch_dotfiles.sh &>/dev/null &

# stow git
# stow nvim
# stow helix
# stow alacritty


# =================
# Fish
# =================

# get the current default shell
current_shell=$(getent passwd $user | cut -d: -f7)

# get the fish shell path
fish_path=$(which fish)

# check if fish is already the default shell
if [ "$current_shell" != "$fish_path" ]; then
    echo "setting fish as the default shell..."

    # add fish to valid login shells if it's not there already
    if ! grep -q "^$fish_path$" /etc/shells; then
        echo "adding fish to valid login shells..."
        command -v fish | sudo tee -a /etc/shells
    fi

    # use fish as the default shell
    sudo chsh -s "$fish_path" $user
    echo "fish is now the default shell."
else
    echo "fish is already the default shell."
fi


# =================
# Nerd-Fonts
# =================

font_directory="$HOME/.local/share/fonts"
font_file="Ubuntu Mono Nerd Font Complete.ttf"
font_url="https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete.ttf"

# Check if the font is already installed
if [ ! -f "${font_directory}/${font_file}" ]; then
    echo "Installing Ubuntu Mono Nerd Font Complete..."

    # Download and install the font
    mkdir -p "$font_directory"
    cd "$font_directory" && curl -fLo "$font_file" "$font_url"

    # Update the font cache
    fc-cache -f -v

    echo "Ubuntu Mono Nerd Font Complete installed."
else
    echo "Ubuntu Mono Nerd Font Complete is already installed."
fi


# =================
# NPM
# =================

desired_npm_prefix="$HOME/.npm-global"

# Check the current NPM prefix
current_npm_prefix=$(npm config get prefix)

# Run the script only if the desired NPM prefix is not set
if [ "$current_npm_prefix" != "$desired_npm_prefix" ]; then
    echo "Configuring NPM to use the desired prefix..."

    # Configure NPM to install in ~/.npm-global, instead of the default folder
    mkdir -p "$desired_npm_prefix"/{lib,bin}
    npm config set prefix "$desired_npm_prefix"

    # Add the new NPM prefix to the PATH
    export PATH="$desired_npm_prefix/bin:$PATH"
    echo "NPM configured to use the desired prefix."
else
    echo "NPM is already configured with the desired prefix."
fi

# =================
# Alacritty themes switcher
# =================

# Check if alacritty-themes is already installed
if ! command -v alacritty-themes &> /dev/null; then
    echo "Installing alacritty-themes switcher..."

    # Install alacritty themes switcher
    npm i -g alacritty-themes

    echo "alacritty-themes switcher installed. Use 'at' in CLI to change themes."
else
    echo "alacritty-themes switcher is already installed."
fi

# =================
# GitHub Login
# =================

# Check if the user is already logged into GitHub
github_token=$(git config --global --get github.oauth-token)

if [ -z "$github_token" ]; then
    echo "Not logged into GitHub. Running 'gh auth login'..."
    gh auth login
else
    echo "Already logged into GitHub."
fi
