# Collection of dotfiles

### Managed Files

* [vim](#vim)
* [tmux](#tmux)
	* [default config](#the-config-file)
	* [dev layouts](#workspace-layouts)
* [bash](#bash)
* [terminator](#terminator)
* [setup script](#setting-up)

## Vim

My vimrc is the most complicated config I currently manage. it is split into multiple sections below for clarity.

##### Plugin Management

I use [Vundle](https://github.com/VundleVim/Vundle.vim) to manage installed plugins. Currently there are plugins for:
* [git integration](https://github.com/tpope/vim-fugitive)
* [a customized status line](https://github.com/vim-airline/vim-airline)
	* [with additional themes](https://github.com/vim-airline/vim-airline-themes)
* [syntax highlighting](https://github.com/vim-syntastic/syntastic)
* [tag navigation](https://github.com/majutsushi/tagbar)
* [a custom colorscheme](https://github.com/nanotech/jellybeans.vim)

##### simple programming settings

By default this sets tabs to be four spaces. Syntax highlighting for matching brackets are enabled and for the languages I program in regularly I set a good color scheme.

##### different key bindings

<Esc> is bound to ;; and to use the tagbar you can press F12

##### Appearance

The status bar is on by default and the serene theme is enabled. For most files the zellner theme is used. If it's a language I use often then jellybeans is applied.

## Tmux

I have two tmux config files. One sets all my normal settings for day to day use. then there is another config that just handles the layouts of panes.

# The Config File

This sets up vim motion bindings to switch panes and sets | or - to create new splits. The appearance of tmux has been modified heavily to create an easy to use environment with a dark status bar.

# Workspace Layouts

This config is meant to be loaded on the fly when I want to do development work. It splits the terminal into a pane on the left for a text editor. one narrow vertical split to run commands in and a third 20% split that can be used for man pages or other reference data.

## Bash

This is a crazy simple config currently. it builds a custom prompt and set's aliases for ls and vi and that's it.

## Terminator

This sets basic appearance settings.

## Setting Up

This is a work in progress script that handles dependency resolution for all the above programs. Currently it's writting to work with Ubuntu, Fedora and Arch. I have only started testing it on Fedora.
