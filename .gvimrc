set showcmd     "display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

""set tw=100       Wrap lines (temp commenting)
set nowrap
set sidescroll=5

"" Whitespace
set cindent
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

colorscheme greens

set guifont=Monaco:h12

set guioptions+=r   "" Enable scrollbar
set guioptions+=a   "" Auto copying on visual select
 
set colorcolumn=100

"" Remove trailing whitespace when saving
autocmd BufWritePre *.py :%s/\s\+$//e

set wrapscan  ""Wrap search
