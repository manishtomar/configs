set indentkeys-=:
set indentkeys-=<:>

set wildignore+=_trial_temp

"" Find-in-files current word in python files; opens in quicklist window
map <F3> :execute "vimgrep /\\<" . expand("<cword>") . "\\>/j **/*.py" <Bar> cw<CR>
