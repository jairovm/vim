# Vim

## Table of Contents

* [About](#about)
  * [Dependencies](#dependencies)
  * [Installing](#installing)
* [Resources](#resources)

## About

### Dependencies

macOS:

```bash
brew install neovim fzf ripgrep ack
gem install solargraph
```

Debian/Ubuntu:

```bash
sudo apt install neovim fzf ripgrep ack nodejs npm ruby ruby-dev build-essential unzip
gem install --user-install --no-document solargraph
```

When using `--user-install`, add the user gem executable directory to your shell
PATH. Find its location with:

```bash
ruby -r rubygems -e 'puts File.join(Gem.user_dir, "bin")'
```

CoC requires Node/npm on both platforms. Install them separately if unavailable.

### Installing

```bash
git clone --recurse-submodules https://github.com/jairovm/vim.git ~/.vim
mkdir -p ~/.config
ln -nsf ~/.vim ~/.config/nvim
ln -nsf ~/.vim/init.vim ~/.vimrc
```

Install the configured CoC extensions from Neovim:

```vim
:CocInstall -sync coc-explorer coc-eslint coc-json coc-solargraph coc-tsserver
```

### Clipboard and fzf

fzf is located through its installed executable, including Homebrew and Debian
package locations. `Ctrl+P` opens file search, and `<leader>pw` searches for the
word under the cursor with ripgrep.

On macOS, the copy/paste mappings use `pbcopy` and `pbpaste`. On Linux with Neovim
0.10 or newer, `Ctrl+C` copies through OSC 52 and visual `Ctrl+X` cuts and copies.
The client terminal must support OSC 52; a multiplexer must forward clipboard writes.

Over SSH from a Mac, paste with the terminal's `Cmd+V`. `"+p` pastes the last value
copied by the current remote editor instance. Classic Vim on Linux uses its normal
registers and terminal selection workflow.

### Resources

- [vim-pathogen](https://github.com/tpope/vim-pathogen)
