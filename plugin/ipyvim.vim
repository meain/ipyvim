function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! ExcecIpython()
" let line_for_ipython = s:get_visual_selection()
let line_for_ipython = getline('.')
python<<_EOF_
import vim
import subprocess as sp
data = vim.eval('line_for_ipython')
p = sp.Popen(['tmux', 'send-keys', '-t', 'ipython:1.0', str(data), 'Enter'], stdout=sp.PIPE)
_EOF_
endfunction

function! ExcecIpythonVisual() range
let line_for_ipython = s:get_visual_selection()
python<<_EOF_
import vim
import time
import subprocess as sp
data = vim.eval('line_for_ipython').split('\n')
for line in data:
    p = sp.Popen(['tmux', 'send-keys', '-t', 'ipython:1.0', str(line), 'Enter'], stdout=sp.PIPE)
    time.sleep(1) # tmux is kinda slow
_EOF_
endfunction

nnoremap <leader>i :call ExcecIpython()<cr>
vnoremap <leader>i :call ExcecIpythonVisual()<cr>
