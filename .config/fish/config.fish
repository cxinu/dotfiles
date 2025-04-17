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
alias cdf='cd "$(fd --type d --hidden --exclude .git --exclude /nix/store --exclude .nix-store . / | fzf)"'

# Environment variables
set -g fish_greeting ""
set -gx EDITOR nvim
set -gx LIBGL_ALWAYS_SOFTWARE 0
set -gx MESA_LOADER_DRIVER_OVERRIDE i965
set -gx MANPAGER "nvim +Man!"
set -gx MANWIDTH 120
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx BAT_THEME "base16"
set -gx TERMINAL ghostty
set -gx PNPM_HOME $HOME/.local/share/pnpm

# Add to PATH
fish_add_path $PNPM_HOME
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/share/nvim/mason/bin

# hooks
direnv hook fish | source
starship init fish | source
# fzf --fish | source
