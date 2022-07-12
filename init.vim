set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin()


" UI related
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" THEMES
Plug 'joshdick/onedark.vim'

" Better Visual Guide
Plug 'Yggdroot/indentLine'

" syntax check
Plug 'w0rp/ale'
  
" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
" Formater
Plug 'Chiel92/vim-autoformat'

" Enable folding with the spacebar
Plug 'tmhedberg/SimpylFold'

" File browsing + Git integration"
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Super searching "
Plug 'kien/ctrlp.vim'


" R plugin "
Plug 'jalvesaq/Nvim-R'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocomplete general pluging 
" on R use install.packages("languageserver")
" on nvim use :CocInstall coc-r-lsp
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" Optional: for snippet support
" Further configuration might be required, read below
Plug 'sirver/UltiSnips'
" Plug 'ncm2/ncm2-ultisnips'

" Optional: better Rnoweb support (LaTeX completion)
Plug 'lervag/vimtex'



" All of your Plugins must be added before the following line
call plug#end()

""""""""""""" LEADER """"""""""""""""""""""""""""""""""""""""""
let mapleader = ";"
let maplocalleader = ","



""""""""""""" Airline""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1


"""""""""""" Setting for NERDTree"""""""""""""""""""

nmap <C-b> :NERDTreeToggle<CR>

" Optional to show special NERDTree browser characters properly (e.g. on remote linux system) 
let g:NERDTreeDirArrows=0


" Lune numbering "
set nu


""""""""""" for R setting""""""""""""""""""""""""""
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_bracketed_paste = 1
let R_latexcmd = ['xelatex']


let R_esc_term = 1

" Emulate Tmux ^az
function ZoomWindow()
  let cpos = getpos(".")
  tabnew %
  redraw
  call cursor(cpos[1], cpos[2])
  normal! zz
endfunction
    
nmap gz :call ZoomWindow()<CR>
"nmap <LocalLeader>kr RMakeRmd Default R mapping to knit file YAML metadata
let g:LanguageClient_serverCommands = {
    \ 'r': ['r', '--slave', '-e', 'languageserver::run()'],
    \ }



""""""" Copy from https://yufanlu.net/2018/09/03/neovim-python/"""""""

" Configurations Part
" UI configuration
syntax on
syntax enable
colorscheme onedark
syntax on
colorscheme onedark
set termguicolors
set number

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1




set number
set relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
" Turn off backup
set nobackup
set noswapfile
set nowritebackup
" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase
" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4
" vim-autoformat
noremap <F3> :Autoformat<CR>
" NCM2
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  " inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  " uncomment this block if you use vimtex for LaTex
  " autocmd Filetype tex call ncm2#register_source({
  "           \ 'name': 'vimtex',
  "           \ 'priority': 8,
  "           \ 'scope': ['tex'],
  "           \ 'mark': 'tex',
  "           \ 'word_pattern': '\w+',
  "           \ 'complete_pattern': g:vimtex#re#ncm2,
  "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  "           \ })
augroup END
" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

