" autosession.vim - auto save/load vim sessions based on git branches
" Maintainer:       Alan Graham <alan at productlab dot com>
" Site:             

" SETUP

if exists('g:loaded_autosession') || v:version < 700 || &cp
    finish
endif
let g:loaded_autosession = 1

" fix for Windows users (https://github.com/wting/gitsessions.vim/issues/2)
if !exists('g:VIMFILESDIR')
    let g:VIMFILESDIR = has('unix') ? $HOME . '/.vim/' : $VIM . '/vimfiles/'
endif

let g:autosessions_dir = 'sessions'

if !exists('s:session_exists')
    let s:session_exists = 0
endif

function! g:AutoSessionSave(name)
  let l:file = a:name
  let s:cached_session_file = l:file
  let s:session_exists = 1
  execute 'mksession!' l:file
  echom "session updated:" l:file
endfunction

function! g:AutoSessionLoad(name)
  let l:file = a:name
  let s:cached_session_file = l:file
  if filereadable(l:file)
    execute 'source' l:file
    let s:session_exists = 1
    echom "session loaded:" l:file
  elseif
    echom "session not found:" l:file
  endif
  redrawstatus!
endfunction

function! g:AutoSessionUpdate()
  if s:session_exists && filereadable(s:cached_session_file)
    execute 'mksession!' s:cached_session_file
    "echom "session updated:" s:cached_session_file
  endif
endfunction

function! g:AutoSessionFile()
  echom s:cached_session_file
endfunction

function! s:session_file(name)
  let s:cached_session_file = g:VIMFILESDIR . g:autosessions_dir . '/' . a:name
  return s:cached_session_file
endfunction

augroup autosessions
    autocmd!
    autocmd BufEnter * :call g:AutoSessionUpdate()
    autocmd VimLeave * :call g:AutoSessionUpdate()
augroup END

command -nargs=1 -complete=file AutoSessionSave call g:AutoSessionSave(<f-args>)
command -nargs=1 -complete=file AutoSessionLoad call g:AutoSessionLoad(<f-args>)
