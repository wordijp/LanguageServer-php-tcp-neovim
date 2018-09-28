scriptencoding utf-8

if exists('g:loaded_languageserver_php_tcp')
    finish
endif
let g:loaded_languageserver_php_tcp = 1

let s:save_cpo = &cpo
set cpo&vim

" -----
let s:initialized = 0

autocmd FileType php call s:initialize()
function! s:initialize() abort
  if s:initialized == 0
    call languageserver_phptcp#start()
    let s:initialized = 1
  end
endfunction
" -----

let &cpo = s:save_cpo
unlet s:save_cpo
