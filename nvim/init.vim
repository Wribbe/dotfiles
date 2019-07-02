call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'tbabej/taskwiki'
Plug 'muggenhor/Vim-Noweb'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

set nocompatible

set number
colorscheme gruvbox
set background=dark

set spell
set spelllang=sv,en

filetype plugin indent on
syntax on

set hlsearch
set noswapfile
set nobackup

set clipboard=unnamed
set clipboard^=unnamedplus

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set cinoptions+=t0

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
set tw=79

let g:python_highlight_space_errors = 0

set printfont=courier:h8
set popt=header:0
set nojoinspaces

" <CTRL-l> redraw the screen and removes any search highlights.
nnoremap <silent> <C-l> :nohl<CR><C-l>

set wildmenu
set hidden

nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>t :Tags<CR>
