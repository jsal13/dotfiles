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
cd configs && ./wsl_init.sh
sudo chsh -s /usr/bin/zsh
```
3. Restart your terminal.

> **Note**
> I'm unsure why `sudo chsh -s /usr/bin/zsh` doesn't work in the `./wsl_init.sh` file, but it doesn't.  It must be run manually.

## Adding a File / Directory

Use `git add -f (your file/dir)`.


## Tree Structure

```text
.
├── .aliases
├── .env
├── .config
│   └── pypoetry
├── .gitconfig
├── .github_pr_template
├── .gitignore
├── .jiratemplate
├── .oh-my-zsh
├── .tmux.conf
├── .zshrc
├── README.md
├── configs
│   ├── ConEmu.xml
│   ├── Microsoft.PowerShell_profile.ps1
│   ├── settings.json
│   ├── win_init.sh
│   └── wsl_init.sh
├── miniconda
└── repos
```
