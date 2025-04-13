if test -f ~/.config/fish/config-private.fish # Source private config if exists
    source ~/.config/fish/config-private.fish
end
if test -f ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end
if test -f /tmp/ranger_wal.sh
    source /tmp/ranger_wal.sh
    rm /tmp/ranger_wal.sh
end
if test "$TERM" = "xterm-kitty"
    wal -R -q
end

set -g fish_greeting ""

# Functions
function ff
    set logo (find /home/cxinu/Pictures/pfp -type f \( -iname "*.png" \) | shuf -n 1)
    fastfetch --config nyarch --kitty-direct $logo --logo-height 4 --logo-padding 1
end

function ffa
    fastfetch --config arch
end

function nvim
    command nohup neovide $argv > /dev/null 2>&1 & disown
end

# Aliases
alias rn="ranger"
alias wn="ranger $HOME/wallpapers"
alias ghce="gh copilot explain"
alias ghcs="gh copilot suggest"
alias sudonvim="sudo -E nvim"
alias vim="NVIM_APPNAME=vim nvim"
alias neovim="command nvim"
# alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :100 {}' --info=inline | xargs -r $EDITOR"
alias cdf='cd "$(fd --type d --hidden --exclude .git --exclude /nix/store --exclude .nix-store . / | fzf)"'



# Environment variables
set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden"
set -gx EDITOR nvim
set -gx LIBGL_ALWAYS_SOFTWARE 0
set -gx MESA_LOADER_DRIVER_OVERRIDE i965
set -gx MANPAGER "nvim +Man!"
set -gx MANWIDTH 120
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx BAT_THEME "base16"
set -gx TERMINAL ghostty

set -gx PNPM_HOME "/home/cxinu/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH $PNPM_HOME $PATH
end


# Add to PATH
for dir in \
    $HOME/bin \
    $HOME/.local/bin \
    $HOME/.cargo/bin \
    $HOME/Odin \
    $HOME/.local/share/nvim/mason/bin \

    if test -d $dir
        set -gx PATH $PATH $dir
    end
end


# fzf shell integration
fzf --fish | source

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
