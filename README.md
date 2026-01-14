# Dotfiles

This repository contains my personal configurations, managed via a **Git Bare Repository**. This approach tracks files directly in `~/.config` without the need for symlinks.

## Screenshots

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/10210ecd-9082-4804-abef-8ec53f9ed1fd" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/1e223ba3-a514-4b03-8bd2-9293d466c73b" />

## Installation

### 1. Alias Setup

Add the `dots` alias to your shell profile to interact with the repository.

```bash
alias dots='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME/.config'
echo "alias dots='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME/.config'" >> ~/.config/fish/config.fish

```

### 2. Clone the Repository

Clone the repository metadata into a hidden directory in your home folder.

```bash
git clone --bare https://github.com/cxinu/dotfiles.git $HOME/.cfg

```

### 3. Deploy Configurations

Checkout the files into your `.config` directory.

```bash
dots checkout

```

> [!TIP]
> If the checkout fails due to existing files, you can force it (caution: this overwrites local changes):
> `dots checkout -f`

### 4. Hide Untracked Files

Ensure the repository only shows the files you've explicitly added.

```bash
dots config --local status.showUntrackedFiles no

```

## Management

### Basic Usage

Use the `dots` alias just like the standard `git` command:

```bash
dots status
dots add <file>
dots commit -m "update message"
dots push origin master

```

### TUI Interface

For a visual management experience, use the `lazygit` wrapper:

```bash
# Add to config.fish
alias ldots='lazygit --git-dir=$HOME/.cfg --work-tree=$HOME/.config'

```
