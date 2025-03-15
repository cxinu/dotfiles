if status is-interactive
    # Commands to run in interactive sessions can go here
	if test (tty) = "/dev/tty1"
    #exec startx
	end
end

if test -f ~/.config/fish/config-private.fish
    source ~/.config/fish/config-private.fish
end

if test -f /tmp/ranger_wal.sh
    source /tmp/ranger_wal.sh
    rm /tmp/ranger_wal.sh
end

wal -R -q
if test -f ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end

set -g fish_greeting ""  # Suppress fish greeting

# fastfetch
function ff
    # Pick a random image from the folder; filtering for PNG and JPG files
    set logo (find /home/cxinu/pfp -type f \( -iname "*.png" \) | shuf -n 1)
    fastfetch --config nyarch --kitty-direct $logo --logo-height 4 --logo-padding 1
end

function ffa
    fastfetch --config arch
end


alias rn="ranger"
alias wn="ranger ~/wallpapers"
alias sp="spotify_player"
alias ghce="gh copilot explain"
alias ghcs="gh copilot suggest"

alias sudonvim="sudo -E nvim"
alias sudoedit="sudo -E nvim"
alias vim="NVIM_APPNAME=vim nvim"

alias r1="~/.scripts/r1.sh"
alias blr="~/.scripts/blur.sh"


# pnpm
set -gx PNPM_HOME "/home/cxinu/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

starship init fish | source
set -Ux EDITOR nvim

set -x LIBGL_ALWAYS_SOFTWARE 0
set -x MESA_LOADER_DRIVER_OVERRIDE i965

export PATH="$PATH:$HOME/Odin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.scripts"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/cxinu/miniforge3/bin/conda
    eval /home/cxinu/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/cxinu/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/cxinu/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/cxinu/miniforge3/bin" $PATH
    end
end

if test -f "/home/cxinu/miniforge3/etc/fish/conf.d/mamba.fish"
    source "/home/cxinu/miniforge3/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<
