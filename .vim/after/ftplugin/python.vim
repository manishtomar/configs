set expandtab       " use spaces, not tabs
map <F3> :execute "vimgrep /\\<" . expand("<cword>") . "\\>/j **/*.py" <Bar> cw<CR>
