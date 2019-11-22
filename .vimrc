set nocompatible              " be iMproved, required
filetype off                  " required

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'shmup/vim-sql-syntax'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'ruanyl/vim-gh-line'
Plugin 'vim-airline/vim-airline'
Plugin 'martinda/Jenkinsfile-vim-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Save file using goimports
let g:go_fmt_command = "goimports"

" ctrlp working path is nearest ancestor containing .git dir starting from cwd
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_switch_buffer=0
" increase size of window from 10 to 20
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

" markdown changes
" disable folding
let g:vim_markdown_folding_disabled = 1


set showcmd     "display incomplete commands

""set tw=100       Wrap lines (temp commenting)
set nowrap
set sidescroll=5

"" Whitespace
set ts=4
set sw=4
set sts=0
set backspace=indent,eol,start  " backspace through everything in insert mode

set ignorecase

"" pressing Tab on :b autocompletes it
set wildchar=<Tab> wildmenu wildmode=full   

set autowrite   "" Automatically write file while switching buffers
set autoread    "" Automatically reload file

" Search
set hlsearch " Highlight search items
set is  " Search as you type
set ic scs " Ignore case unless both upper and lower case is typed
set scrolloff=5 " Ensure 5 lines are above or below cursor

" show cursor position at all times
set ruler
set number  "show line numbers
set cursorline "show mild cursor line

" showmatch: Show the matching bracket for the last ')'?
set showmatch

if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

"" Enable coloring on mac os
set t_Co=256
syntax on

let macvim_skip_colorscheme=1
colorscheme blackboard

set guifont=Monaco:h12

" set guioptions+=r   "" Disable scrollbar to get more space
set guioptions+=a   "" Auto copying on visual select

set colorcolumn=100

"" Remove trailing whitespace when saving
autocmd BufWritePre *.py :%s/\s\+$//e

set wrapscan  ""Wrap search

"" Map window movement keys
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"" Find-in-files current word; opens in quicklist window
map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

"" When opening files from quickfix window, open in existing buffer if available
"" or new vertical split window
set switchbuf=useopen
