# starship prompt
starship init fish | source

# Auto-stow dotfiles script
if not pgrep -f "watch_dotfiles.sh" >/dev/null
    nohup ~/.dotfiles/scripts/watch_dotfiles.sh >/dev/null 2>&1 &
    set -l pid (pgrep -f "watch_dotfiles.sh")
    disown $pid
end

# fzf 
function fish_user_key_bindings
  if command -s fzf-share >/dev/null
    source (fzf-share)/key-bindings.fish
  end
  fzf_key_bindings
end

set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --multi --bind ctrl-h:preview-page-up,ctrl-l:preview-page-down'

set -gx FZF_CTRL_T_COMMAND 'rg --files --hidden $HOME'
set -gx FZF_CTRL_T_OPTS '--preview="bat --color=always --style=numbers --line-range=:500 {}" '

set -gx FZF_CTRL_R_OPTS ''

set -gx FZF_ALT_C_COMMAND 'find . -maxdepth 1 -type d'
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -100'"


# fff file browser
function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end

# File browsing
alias l='exa -F -s type'
alias la='exa -F -a'
alias ll='exa -F -l --no-user -s type'
alias lt='exa --tree'
alias mkdir='mkdir -p'
alias .df='cd ~/.dotfiles/'

function folder
    mkdir -p $argv[1]
    cd $argv[1]
end

alias rm='trash'
# alias restore='trash list | fzf --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs trash restore --match=exact --force'

# Clean NVIM Cach
alias nvim-clean-cache='rm ~/.local/share/nvim/packer_compiled.lua && rm -rf ~/.cache/nvim && rm -rf ~/.local/site/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.cache/nvim'

# Helix
set -gx EDITOR hx
set -gx VISUAL $EDITOR

# Source fish config
alias sfc='source ~/.config/fish/config.fish'

# Edit fish config
alias efc='$EDITOR ~/.config/fish/config.fish'

# NPM
set -gx PATH ~/.npm-global/bin $PATH

# Alacritty-themes
alias at='alacritty-themes'

# Lazygit
alias lg='lazygit'

# Xmodmap (bind Caps lock to Escape)
if test -e ~/.Xmodmap
    xmodmap ~/.Xmodmap
end

# Docker
alias d='docker'

function dclear
    docker ps -a -q | xargs docker kill -f
    docker ps -a -q | xargs docker rm -f
    docker images | awk '{print $3}' | xargs docker rmi -f
    docker volume prune -f
end

# Fisher
# Check if Fisher is installed and the loop prevention variable is not set
if not set -q FISHER_LOOP_PREVENTION; and not test -f $HOME/.config/fish/functions/fisher.fish
    # Set a temporary loop prevention variable
    set -gx FISHER_LOOP_PREVENTION 1

    # Install Fisher
    echo "Installing Fisher plugin manager for fish shell"
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    echo "Fisher installed successfully."

    # Unset the loop prevention variable
    set -e FISHER_LOOP_PREVENTION
end

# zk
set -gx ZK_NOTEBOOK_DIR ~/Constellation

# taskwarrior
alias in='task add +in'
