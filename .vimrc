set showcmd     "display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

""set tw=100       Wrap lines (temp commenting)
set nowrap
set sidescroll=5

"" Whitespace
set expandtab       " use spaces, not tabs
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

" show cursor position at all times
set ruler
set number  "show line numbers

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
colorscheme greens

set guifont=Monaco:h12

set guioptions-=r   "" Disable scrollbar to get more space
set guioptions+=a   "" Auto copying on visual select

set colorcolumn=80

"" Remove trailing whitespace when saving
autocmd BufWritePre *.py :%s/\s\+$//e

set wrapscan  ""Wrap search

"" This didn't work due to python.vim. Made changes there
"" set indentkeys-=:   "" Do not indent with ':'
"" set indentkeys-=<:>   "" Do not indent with ':'

"" Map window movement keys
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
