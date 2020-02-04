" <3 graywh
syntax on
colorscheme graywh "or ir_black
set nocompatible
set clipboard=unnamed
set nocompatible
set nowrap
set number
set showmatch
set ttyfast
set title
set wrapmargin=0
set shiftwidth=2
set tabstop=8
set softtabstop=2
set expandtab
set formatoptions=cn
set fileformats=unix,mac,dos
set wildmenu
set wildmode=longest:full,full
" set dir=~/.vim/swap//,~/.vim/undo//,/tmp//,.
set undofile
set undolevels=100
set undoreload=100

if has('autocmd') && exists(':filetype') == 2
  filetype plugin indent on
endif

if exists(':syntax') == 2
  syntax enable
  syntax sync fromstart
endif

" show spaces as dots
set listchars=
set listchars+=trail:·
set listchars+=extends:→
set listchars+=precedes:←
set listchars+=tab:»·
set list

" windows, buffers
set hidden
if exists('&switchbuf')
  set switchbuf=useopen
  if v:version >= 700
    set switchbuf+=usetab
  endif
endif
set splitbelow
set splitright

" window nav
nnoremap <silent> <Left>  <C-w>h
nnoremap <silent> <Right> <C-w>l
nnoremap <silent> <Up>    <C-w>k
nnoremap <silent> <Down>  <C-w>j
" nnoremap <C-p> :CtrlP<CR>

if has("gui_vimr")
  nnoremap <silent><D-S-{> gT
  nnoremap <silent><D-S-}> gt
  nnoremap <silent><D-S><Right> :bnext<CR>
  nnoremap <silent><D-S><Left> :bprevious<CR>
  "nnoremap <D-h>  :bfirst<CR>
  "nnoremap <D-k>  :bnext<CR>
  "nnoremap <D-j>  :bprevious<CR>
  "nnoremap <D-l>  :blast<CR>
  "nnoremap <D-e>  :e<Space>
  "nnoremap <D-E>  :enew<CR>
endif

" remove white space on save
autocmd BufWritePre * :%s/\s\+$//e
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

" diff mode
if exists('&diffopt')
  set diffopt=filler
  set diffopt+=iwhite
  if v:version >= 700
    set diffopt+=vertical
    set diffopt+=foldcolumn:2
  endif
endif

" vim info
set laststatus=2                " Always display the statusline
set ruler                       " Show position even without status line
set showcmd                     " Show (partial) command in status line
set vb t_vb=                    " Disable visual and audible bell
set history=50                  " Keep 50 lines of command line history
set viminfo=
set viminfo+='100               " Remember 100 previously edited files' marks
set viminfo+=!                  " Remember some global variables
set viminfo+=h                  " Don't restore the hlsearch highlighting

" vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'prettier/vim-prettier'
" Plugin 'sbdchd/neoformat'
Plugin 'vim-syntastic/syntastic'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
" Plugin 'w0rp/ale'
" Plugin 'spolu/dwm.vim'
" Plugin 'roman/golden-ratio'
" SnipMate shit required by vim-es6
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
call vundle#end()

let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_cmd = 'E'
" let b:ale_fix_on_save = 1
" let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'eslint']
"
" CtrlP ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" eslint syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" prettier
" autocmd BufWritePre *.js Neoformat
" autocmd BufWritePre,TextChanged,InsertLeave *.js Neoformat
" more prettier
" when running at every change you may want to disable quickfix
let g:prettier#autoformat = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" vim-javascript
" https://vimawesome.com/plugin/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1


