# Dotfile

This directory is maintained as a [dotfile](https://www.webpro.nl/articles/getting-started-with-dotfiles) repository.

## Quickstart

> **Warning**
> Make sure you have SSH credentials which will let you clone from github!

1. Go into your home directory.

2. Run the following commands:

    ```shell
    git init
    git checkout -b main
    git remote add origin git@github.com:jsal13/dotfiles
    git pull origin main
    cd configs && ./wsl_init.sh
    sudo chsh -s /usr/bin/zsh
    ```

3. Restart your terminal.

> **Note**
> I'm unsure why `sudo chsh -s /usr/bin/zsh` doesn't work in the `./wsl_init.sh` file, but it doesn't.  It must be run manually.

## Adding a File / Directory

Use `git add -f (your file/dir)`.

