function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

noremap <leader>d<space> :call StripWhitespace()<CR>

augroup whitespace_strip_group
  autocmd!
  autocmd BufWritePre * call StripWhitespace()
augroup END
