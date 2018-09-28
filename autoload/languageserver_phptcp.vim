function! languageserver_phptcp#start() abort
  let l:addr = '127.0.0.1'
  let l:port = s:getPort()
  let l:url = l:addr.':'.l:port

  let l:pls = globpath(&rtp, 'vendor/felixfbecker/language-server/bin/php-language-server.php', 1)
  let l:pls = split(l:pls,"\n")[0]
  let l:cmd_pls_sv = 'php '.l:pls.' --tcp-server='.l:url
  if has('win32')
    silent execute '!start /min ' . l:cmd_pls_sv
  else
    silent execute '!' . l:cmd_pls_sv . ' &'
  endif
  
  call LanguageClient_registerServerCommands({'php': ['tcp://'.l:url]})
endfunction

function! s:getPort() abort
  return system(s:portBin())
endfunction

let s:root = expand('<sfile>:p:h:h')
function! s:portBin() abort
  let l:exe = 'availableport'
  if has('win32')
    let l:exe .= '.exe'
  endif
  
  return s:root . '/bin/' . l:exe
endfunction
