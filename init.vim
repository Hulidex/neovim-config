" Author: Jolu Izquierdo
" To run this neovim config you have to install first:
" - python2, python3, python-pip2 and python-pip3 check :help provider-python
" - git
" - vim-plug (plugin manager) -> https://github.com/junegunn/vim-plug
" - deople plugin has a certain requirements -> https://github.com/Shougo/deoplete.nvim#requirements
" - deoplete can complete multiples languages -> https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources
" - go to ALE section(look for it below) to install  and configure linters
" - vim-devicons and oceanic-next need to install a nerd compatible font (see
"   below)
" To reload vim config -> :source ~/.config/nvim/init.vim
" When everything is installed, run :PlugInstall, then close and reopen vim
" Check everything is okey -> :checkhealth
"-------------------------------------------------------------------------------

" First argument is nvim plugin PATH
call plug#begin('~/.local/share/nvim/plugged')

" Show git changes on nerd-tree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Show a list of directories and files
Plug 'scrooloose/nerdtree'
" Comment lines easily
Plug 'scrooloose/nerdcommenter'

" Autocomplete features
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'

" Check syntax
Plug 'w0rp/ale'
" Surround text with parentheses, brackets, quotes, XML tags, and more
" See syntax -> https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
" wisely add close code blocks in Ruby, and many other languages
Plug 'tpope/vim-endwise'
" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" Rename and other stuff with tabs
Plug 'gcmt/taboo.vim'
" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Highlight unwanted withespaces
Plug 'bronson/vim-trailing-whitespace'

" Preview markdown on your modern browser with synchronised scrolling and flexible configuration
" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" PLUGINS FOR MANAGE BUFFERS:
" Vim plugin to list, select and switch between buffers.
Plug 'jeetsukumaran/vim-buffergator'

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" Syntax support for multiples languages
Plug 'sheerun/vim-polyglot'

" Syntax support for pug files
Plug 'digitaltoad/vim-pug'

" Vim plugin wich shows a git diff
Plug 'airblade/vim-gitgutter'

" This plugin provides a start screen for Neovim
Plug 'mhinz/vim-startify'

" Change NEOVIM appearance:
" Colors:
"Plug 'mhartington/oceanic-next'
Plug 'tyrannicaltoucan/vim-deep-space'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" Icons for popular vim plugins
" Need to install a nerd compatible font:
" https://github.com/ryanoasis/nerd-fonts#font-installation
" I installed just Hack font:
"   - clone repo with option --depth=1
"   - run script ./install Hack
Plug 'ryanoasis/vim-devicons'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Preview colours in source code while editing
Plug 'ap/vim-css-color'

call plug#end()

" ---------- GENERAL CONFIG----------
" Self explanatory
set encoding=UTF-8

" Change mapleader from '\' to ',', I'm doing this because my keyboard
" mapping is Spanish
let mapleader=","

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

" Activate mouse
set mouse=a

" Show a vertical line to know when you have to jump to the next line
set colorcolumn=100

" Don't create .swp files!
set noswapfile

" Highlight actual line
set cursorline

" Let you copy FROM neovim to System clipboard
set clipboard=unnamedplus

" Auto reload files if other program changes them
set autoread

" Display invisible characters
set list

" Set invisible characters with an specific character
set listchars=eol:➥

" Save session on quitting Vim
autocmd VimLeave * mksession! ~/.nvimsessions/last_session.vim

" Restore session
nmap <leader>rs :source ~/.nvimsessions/last_session.vim<CR>

" Split windows right instead of left
set splitright

" MAP OTHER KEYS
nmap <leader>wh :wincmd h<CR>
nmap <leader>wj :wincmd j<CR>
nmap <leader>wk :wincmd k<CR>
nmap <leader>wl :wincmd l<CR>
nmap <leader>w- :split<CR>
nmap <leader>w\ :vsplit<CR>
nmap <leader>wq :quit<CR>
" ---------- NERDTREE ----------
" Bind <C-n> to open nerdtree
nmap  <leader>nt :NERDTreeToggle<CR>

" Open nerdtree if vim is open without a file
" This config is interfering with startify plugin,
" so i comment it in favor of startify
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only tab left open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Close nerd-tree before close vim
autocmd VimLeave * NERDTreeClose

" ---------- DEOPLE.NVIM----------
" see :help deoplete-options for more options
" Use deople
let g:deoplete#enable_at_startup = 1

" list at maximum 100 elements (default 500)
call deoplete#custom#option('max_list', 100)

" ---------- NERDCOMMENTER----------
" With nerdcommenter when you reach 80 characters in a line, automatically it
" creates a new one four you

" Set a whitespace after the commentary

let NERDSpaceDelims=1

" By default you only have one second to press the nerdcommenter command
set timeout timeoutlen=1500

filetype plugin on

" ---------- TABOO----------

" terminal style tabs even in gui versions
set guioptions-=e

" Taboo is able to remember tab names when you save the current session but you are required
" to set the following option
set sessionoptions+=tabpages,globals

" ---------- MARDOWN-PREVIEW----------
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 1

" use a custom port to start server or random for empty
let g:mkdp_port = '8080'

" ---------- ALE----------
" Install 'flake8' linter first -> http://flake8.pycqa.org/en/latest/
" Specify linters for languages
let g:ale_linters = {
      \  'python': ['flake8'],
      \  'ruby': ['rubocop'],
      \  'javascript': ['eslint']
      \}
" Force ale to only lint files specified on 'ale_linters' (watch above)
" let g:ale_linters_explicit = 1

" use ale integrated with airline
let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 3000

" ---------- VIM-GITGUTTER----------
" Diff markers appear automatically, by with a delay governed by vim's
" updatetime, default value is 4000ms (4 seconds), I prefer to put it to 100ms
set updatetime=100

" By default when more than 500 changes are made into a file gitgutter stop
" showing signs
let g:gitgutter_max_signs = 1000

" ---------- CTRLP ---------
" To see options check
" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" Set CtrlP working directory to the nearest ancestor of the current file that
" contains one of these directories or files: .git .hg .svn .bzr
let g:ctrlp_working_path_mode = 'r'

" Exclude files and directories
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(obj|exe|so|dll)$',
  \ }

" Map CtrlP keys:
nmap <leader>p :CtrlP<CR>
nmap <leader>bb :CtrlPBuffer<CR>
nmap <leader>bm :CtrlPMRU<CR>
nmap <leader>ba :CtrlPMixed<CR>

" ---------- VIM-BUFFERGATOR ---------
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Go to the previous buffer open
nmap <leader>bj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>bk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" To open a new empty buffer
nmap <leader>T :enew<cr>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<cr>

" ---------- OCEANIC NEXT (FONT) NOT USED----------
" if (has("termguicolors"))
  " set termguicolors
" endif

" syntax on

" let g:oceanic_next_terminal_bold=1
" let g:oceanic_next_terminal_italic=1
" let g:airline_theme='oceanicnext'
" colorscheme OceanicNext

" ---------- DEEP-SPACE (FONT)----------
syntax on
set background=dark
set termguicolors
colorscheme deep-space
let g:deepspace_italics=1
let g:airline_theme='deep_space'

" ---------- AIRLINE ----------
"  Show a smarter tab upper line
"let g:airline#extensions#tabline#enabled = 1

" ---------- INDENTLINE ----------
" Each indent level has a distinct character:
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

