#!/bin/bash

CONFIG_DIR="$(pwd)"

create_symlink() {
    local source_file="$1"
    local target_file="$2"

    # Backup existing file or directory
    if [ -f "$target_file" ] || [ -d "$target_file" ]; then
        echo "Backup existing $target_file to ${target_file}.bak"
        mv "$target_file" "${target_file}.bak"
    fi

    # Create symlink
    echo "Symlink $target_file -> $source_file"
    ln -s "$source_file" "$target_file"
}

create_symlink "$CONFIG_DIR/nvim" "$HOME/.config/nvim"
create_symlink "$CONFIG_DIR/.gitconfig" "$HOME/.gitconfig"
create_symlink "$CONFIG_DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$CONFIG_DIR/alacritty.toml" "$HOME/.config/alacritty.toml"
create_symlink "$CONFIG_DIR/picom.conf" "$HOME/.config/picom.conf"
create_symlink "$CONFIG_DIR/starship.toml" "$HOME/.config/starship.toml"

echo "Setup complete!"

