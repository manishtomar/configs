"" Find-in-files current word in python files; opens in quicklist window
map <F3> :execute "vimgrep /\\<" . expand("<cword>") . "\\>/j **/*.go" <Bar> cw<CR>
"" Ignore vendor/ dir when using vimgrep
set wildignore+=vendor/**,vendor
