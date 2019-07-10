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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

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

