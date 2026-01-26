if test -f ~/.config/fish/config-private.fish # Source private config if exists
    source ~/.config/fish/config-private.fish
end

if test -f ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
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
    if test (count $argv) -eq 0
        command nohup env -C ~/Programming neovide \
            > /dev/null 2>&1 & disown
    else
        command nohup neovide $argv \
            > /dev/null 2>&1 & disown
    end
end
function grc
    gcc $argv && ./a.out && rm a.out
end



function __edit_cmd_in_editor
    set tmpfile (mktemp /tmp/fish_cmd_edit.XXXXXX)
    commandline > $tmpfile
    neovim $tmpfile
    commandline (cat $tmpfile)
    rm $tmpfile
end


function ranger-cd
    set tempfile (mktemp)
    ranger --choosedir=$tempfile $argv
    if test -f $tempfile
        set dir (cat $tempfile)
        if test -n "$dir" -a -d "$dir"
            cd $dir
        end
        rm -f $tempfile
    end
end

function fish_user_key_bindings
    bind \ce __edit_cmd_in_editor
end

function load_opencv
    set -gx PYTHONPATH /home/cxinu/Programming/github/opencv/build/lib/python3 $PYTHONPATH
    echo "OpenCV build loaded into PYTHONPATH"
end

# Init
if test "$TERM" = "xterm-kitty"
    # ffa
    # wal -R -q -n
end

# Aliases
alias tel="shutdown now"
alias rn="ranger-cd"
alias wn="ranger ~/Pictures/Wallpapers"
alias ghce="gh copilot explain"
alias ghcs="gh copilot suggest"
alias sudonvim="sudo -E nvim"
alias vim="NVIM_APPNAME=vim nvim"
alias neovim="command nvim"
alias cdf='cd "$(fd --type d --hidden --exclude .git --exclude /nix/store --exclude .nix-store . / | fzf)"'
alias dc="docker compose"
alias lg="lazygit"
alias dots='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME/.config'
alias ldots='lazygit --git-dir=$HOME/.cfg --work-tree=$HOME/.config'

# should be default?
alias ip='ip -c'

# Environment variables
set -g fish_greeting ""
set -gx EDITOR nvim
set -gx LIBGL_ALWAYS_SOFTWARE 0
set -gx MESA_LOADER_DRIVER_OVERRIDE i965
set -gx MANPAGER "nvim +Man!"
set -gx MANWIDTH 120
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx BAT_THEME "base16"
set -gx TERMINAL kitty
set -gx PNPM_HOME $HOME/.local/share/pnpm
set -x ANDROID_HOME $HOME/opt/android-sdk
set -x PGADMIN_CONFIG_LOCAL ~/.config/pgadmin4/config_local.py

## For development
set -gx PATH /home/cxinu/Programming/remote/caelestia-cli/bin $PATH

# Add to PATH
fish_add_path $PNPM_HOME
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/share/nvim/mason/bin
fish_add_path /opt/openresty/bin
fish_add_path $(go env GOPATH)/bin
fish_add_path $HOME/.config/emacs/bin

fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path $ANDROID_HOME/platform-tools

# hooks
starship init fish | source
direnv hook fish | source
# fzf --fish | source
