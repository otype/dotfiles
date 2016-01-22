python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

colo desert
syntax enable

set autochdir
set autoread                                " reload files when changed on disk, i.e. via `git checkout`
set autowrite                               " Automatically save before commands like :next and :make
set directory-=.                            " don't store swapfiles in the current directory
set encoding=utf-8
set hlsearch                                " highlight search things
set ignorecase                              " case-insensitive search
set incsearch                               " search as you type
set laststatus=2
set shiftwidth=2                            " normal mode indentation commands use 2 spaces
set showmatch                               " show matching brackets.
set tabstop=4                               " The number of spaces count for a TAB.
set t_Co=256
