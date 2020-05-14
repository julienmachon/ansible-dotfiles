if &compatible
  set nocompatible
endif

set shiftround
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:»·,trail:·
set clipboard+=unnamedplus

set number
set relativenumber

set cursorline
set cursorcolumn

set autoindent
set copyindent

set splitbelow
set splitright

set encoding=utf-8

" Stop creating backup and swap files
set noswapfile
set nobackup
set nowb

" Shortcuts

" Required:
set runtimepath+=~/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.dein')
  call dein#begin('~/.dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.dein/repos/github.com/Shougo/dein.vim')

  " Tools
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('w0rp/ale')
  call dein#add('artur-shaik/vim-javacomplete2')
  call dein#add('mhartington/nvim-typescript', { 'build': './install.sh' })
  call dein#add('ternjs/tern_for_vim', { 'build': 'npm install' })
  call dein#add('carlitux/deoplete-ternjs', { 'build': 'npm install -g tern', 'depends': ['deoplete.nvim', 'tern_for_vim'] })
  call dein#add('pbogut/deoplete-elm', { 'build': 'npm install -g elm-oracle', 'depends': ['deoplete.nvim'] })

  " UI
  call dein#add('chriskempson/base16-vim')
  call dein#add('mhinz/vim-startify')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')

  " Git
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')

  " Language syntax
  call dein#add('sheerun/vim-polyglot')

  " needs to be loaded after most plugins
  call dein#add('ryanoasis/vim-devicons')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" Config colours
let base16colorspace=256
set background=dark
syntax enable
colorscheme base16-materia

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_eighties'

" Terminal
:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" Goyo
let g:goyo_width = 150
let g:goyo_height = 90
let g:goyo_linenr = 0

" NERDTree
map <C-n> :NERDTreeToggle<CR> "opens NertTree with Ctrl-n

" Fuzzy-find with fzf
map <C-p> :Files<cr>
nmap <C-p> :Files<cr>

" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]
