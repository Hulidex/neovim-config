"-------------------------------------------------------------------------------
" Author: Jolu Izquierdo
" To run this neovim config you have to install first:
" - python2, python3, python-pip2 and python-pip3 check :help provider-python
" - git
" - vim-plug (plugin manager) -> https://github.com/junegunn/vim-plug
" - deople plugin has a certain requirements -> https://github.com/Shougo/deoplete.nvim#requirements
" - deoplete can complete multiples languages -> https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources
" To reload vim config -> :source ~/.config/nvim/init.vim
" When everything is installed, run :PlugInstall, then close and reopen vim
"-------------------------------------------------------------------------------

" First argument is nvim plugin PATH
call plug#begin('~/.local/share/nvim/plugged')

" Show a list of directories and files
Plug 'scrooloose/nerdtree'
" Comment lines easily
Plug 'scrooloose/nerdcommenter'

" Autocomplete features
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Surround text with parentheses, brackets, quotes, XML tags, and more
" See syntax -> https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
" wisely add close code blocks in Ruby, and many other languages
Plug 'tpope/vim-endwise'

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Highlight unwanted withespaces
Plug 'bronson/vim-trailing-whitespace'

call plug#end()

" ---------- GENERAL CONFIG----------
" Show line numbers
set number

" Self explanatory
set autoindent

" Use SPACES insted of TABS
set expandtab

" Maximum width of a tab character
set tabstop=2
" Same as before but apply to INSERT MODE
set softtabstop=2
set shiftwidth=2

" When searching go to first occurrence
set incsearch

" ---------- NERDTREE ----------
" Bind <C-n> to open nerdtree
map  <C-n> :NERDTreeToggle<CR>

" Open nerdtree if vim is open without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only tab left open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---------- DEOPLE.NVIM----------
"  see :help deoplete-options for more options
"  Use deople
let g:deoplete#enable_at_startup = 1

" list at maximum 100 elements (default 500)
call deoplete#custom#option('max_list', 100)

" ---------- NERDCOMMENTER----------
"  With nerdcommenter when you reach 80 characters in a line, automatically it
"  creates a new one four you

"  Change mapleader from '\' to ',', I'm doing this because my keyboard

"  mapping is Spanish
let mapleader=","

" By default you only have one second to press the nerdcommenter command
set timeout timeoutlen=3000

filetype plugin on

