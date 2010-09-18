" --------------------------------------------------------------
" File:  .vimrc
" Author: reiv
" --------------------------------------------------------------

" --------------------------------------------------------------
" General:
" --------------------------------------------------------------
set nocp                   " Jailbait
set history=1000           " Command history
set nospell                " Write code, not prose

syntax on                  " Syntax highlighting
filetype plugin indent on  " Filetype detection

" --------------------------------------------------------------
" Appearance:
" --------------------------------------------------------------
set background=dark  " Optimize colors for a dark background
set number           " Show line numbers
set ruler            " Show current cursor position
set shortmess=fnx    " Abbreviate messages
set showmode         " Show current mode in the status line
set showcmd          " Show current command in the status line
set nolazyredraw     " Always redraw the screen

" 'Invisible' characters
set listchars=tab:▸\ ,eol:¬

if has("gui_running")
    set guicursor=a:blinkon0
    set guifont=Envy\ Code\ R\ 11
    set guioptions-=T  " no toolbar
    set guioptions+=b  " horizontal scrollbar
    set mousehide      " hide the mouse pointer when typing
    " colorscheme underwater-mod
    colorscheme molokai
endif

" --------------------------------------------------------------
" Search:
" --------------------------------------------------------------
set hlsearch       " Highlight search pattern matches
set incsearch      " Immediate feedback on search pattern
set ignorecase     " Searches are case-insensitive
set smartcase      " Overrides 'ignorecase' when search pattern
                   " contains uppercase letters.

" --------------------------------------------------------------
" Formatting:
" --------------------------------------------------------------
set tabstop=4      " Number of spaces in a <Tab>
set shiftwidth=4   " Number of spaces to use for (auto)indent
set textwidth=79   " Maximum line width (word wrap)
set nowrap         " Don't wrap lines visually

set formatoptions+=r,n,1 " See :help fo-table

" --------------------------------------------------------------
" Misc:
" --------------------------------------------------------------
set showcmd        " Show (partial) command in status line
                   " pattern inclused uppercase letters
set backspace=2    " Allow backspacing over everything
set visualbell     " No beeps

" --------------------------------------------------------------
" Backups:
" --------------------------------------------------------------
set nobackup
set nowritebackup
set noswapfile

" --------------------------------------------------------------
" Mappings:
" --------------------------------------------------------------
" <LEADER> key
let mapleader = ","

ino jj <esc>
cno jj <C-c>

" Strin whitespace
map <LEADER>s :%s/ \+$//g<CR>:nohl<CR>

if !exists("b:runonce")
    " Load Vim bundles from .vim/bundle/
    call pathogen#helptags()
    call pathogen#runtime_append_all_bundles()
    " Auto-reload .vimrc
    autocmd bufwritepost .vimrc source $MYVIMRC
    let b:runonce = 1
endif

" vim:set shiftwidth=4 softtabstop=4 expandtab textwidth=79:
