# starship prompt
starship init fish | source

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

function folder
  mkdir -p $argv[1]
  cd $argv[1]
end

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