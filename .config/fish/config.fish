# Source private config if exists
if test -f ~/.config/fish/config-private.fish
    source ~/.config/fish/config-private.fish
end

# Handle wal and ranger_wal
if test -f /tmp/ranger_wal.sh
    source /tmp/ranger_wal.sh
    rm /tmp/ranger_wal.sh
end
wal -R -q
if test -f ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end

# Set fish greeting
set -g fish_greeting ""

# Functions
function ff
    set logo (find /home/cxinu/pfp -type f \( -iname "*.png" \) | shuf -n 1)
    fastfetch --config nyarch --kitty-direct $logo --logo-height 4 --logo-padding 1
end

function ffa
    fastfetch --config arch
end

# Aliases
alias rn="ranger"
alias wn="ranger ~/wallpapers"
alias sp="spotify_player"
alias ghce="gh copilot explain"
alias ghcs="gh copilot suggest"
alias sudonvim="sudo -E nvim"
alias vim="NVIM_APPNAME=vim nvim"
alias r1="~/.scripts/r1.sh"
alias blr="~/.scripts/blur.sh"
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :100 {}' --info=inline | xargs -r $EDITOR"

# Environment variables
set -gx EDITOR nvim
set -gx PNPM_HOME "/home/cxinu/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH $PNPM_HOME $PATH
end
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --glob '!nix-store/*'"
set -gx LIBGL_ALWAYS_SOFTWARE 0
set -gx MESA_LOADER_DRIVER_OVERRIDE i965
set -gx MANPAGER "nvim +Man!"
set -gx MANWIDTH 120

# Add to PATH
set -gx PATH $PATH $HOME/Odin
set -gx PATH $PATH $HOME/.cargo/bin
set -gx PATH $PATH $HOME/.scripts

# Initialize starship
starship init fish | source

# Conda initialization
if test -f /home/cxinu/miniforge3/bin/conda
    eval /home/cxinu/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/cxinu/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/cxinu/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -gx PATH "/home/cxinu/miniforge3/bin" $PATH
    end
end
if test -f "/home/cxinu/miniforge3/etc/fish/conf.d/mamba.fish"
    source "/home/cxinu/miniforge3/etc/fish/conf.d/mamba.fish"
end

# Direnv hook
direnv hook fish | source
