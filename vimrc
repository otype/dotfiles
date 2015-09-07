colo desert
set autochdir
set autoindent
set autoread                                " reload files when changed on disk, i.e. via `git checkout`
set autowrite                               " Automatically save before commands like :next and :make
set backspace=2                             " Fix broken backspace in some setups
set backupcopy=yes                          " see :help crontab
set clipboard=unnamed                       " yank and paste with the system clipboard
set directory-=.                            " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                               " expand tabs to spaces
set fileencodings=utf-8,latin-1,chinese
set guifont=Monaco:h12
set guioptions-=T
set history=100 
set hlsearch                                " highlight search things
set ignorecase                              " case-insensitive search
set incsearch                               " search as you type
set iskeyword+=_,$,@,%,#,-                  " don't linebreak when encounter these characters.
set laststatus=2                            " always show statusline
set matchtime=2                             " the length of time to show matching parent.
set ruler                                   " show where you are
set scrolloff=3                             " show context above/below cursorline
set shiftwidth=2                            " normal mode indentation commands use 2 spaces
set showcmd
set showmatch                               " show matching brackets.
set smartcase                               " case-sensitive search if any caps
set smarttab                                " Insert appropriate spaces in front of line according to 
                                            " shiftwidth, tabstop, softtabstop.
                                            " Turn off vi compatibility
set nocompatible
set smartindent
filetype indent on                          " load indent file for the current filetype
set softtabstop=2                           " insert mode tab and backspace use 2 spaces
set tabstop=4                               " The number of spaces count for a TAB.
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                " show a navigable menu for tab completion
set wildmenu                                " Popup a window showing all matching command above command line when autocomplete.
set wildmode=longest,list,full
syntax enable
