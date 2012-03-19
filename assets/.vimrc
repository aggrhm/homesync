" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 May 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

	set nocompatible

	" allow backspacing over everything in insert mode
	"set backspace=indent,eol,start

	" fix backspacing in xterm
	"set t_kb=
	set autoindent		" always set autoindenting on
	if has("vms")
	  set nobackup		" do not keep a backup file, use versions instead
	else
	  set backup		" keep a backup file
	endif
	set history=50		" keep 50 lines of command line history
	"set ruler		" show the cursor position all the time
	set showcmd		" display incomplete commands
	set incsearch		" do incremental searching
	set makeprg=cmake

	" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
	"
	" let &guioptions = substitute(&guioptions, "t", "", "g")
	set guioptions=ai
	"set guifont=Courier\ 10\ Pitch\ 10
	set guifont=Monaco:h11

	" Don't use Ex mode, use Q for formatting
	map Q gq

	" This is an alternative that also works in block mode, but the deleted
	" text is lost and it only works for putting the current register.
	"vnoremap p "_dp


	" Set shift width (indent) to 4 spaces
	set shiftwidth=2
	set softtabstop=2
	set ts=2

	set tags=/osi/common/vob/tags,./tags

	" Uncomment this line to turn off backup files
	set nobackup

	" Switch syntax highlighting on, when the terminal has colors
	" Also switch on highlighting the last used search pattern.
	if &t_Co > 2 || has("gui_running")
	  syntax on
	  set hlsearch
	endif

	" Only do this part when compiled with support for autocommands.
	if has("autocmd")

	  " Enable file type detection.
	  " Use the default filetype settings, so that mail gets 'tw' set to 72,
	  " 'cindent' is on in C files, etc.
	  " Also load indent files, to automatically do language-dependent indenting.
	  if v:version >= 600
	    filetype plugin indent on
	  endif

	  " For all text files set 'textwidth' to 78 characters.
	  autocmd FileType text setlocal textwidth=78

	  " When editing a file, always jump to the last known cursor position.
	  " Don't do it when the position is invalid or when inside an event handler
	  " (happens when dropping a file on gvim).
	  autocmd BufReadPost *
	    \ if line("'\"") > 0 && line("'\"") <= line("$") |
	    \   exe "normal g`\"" |
	    \ endif

	  " When the file changes outside of this buffer, notify the user.
	  " Comment out this line to notify the user and raise a reload dialog.
	  "autocmd FileChangedShell * echo "File has changed outside of this buffer."

	endif " has("autocmd")

	" associate *.ctp with php filetype
	au BufRead,BufNewFile *.ctp set syntax=php
	au BufRead,BufNewFile *.thtml set syntax=php
	au BufRead,BufNewFile *.module set syntax=php

autocmd BufEnter * :cd %:p:h

if has("gui_running")
	set co=80
	set lines=40
	colors eclipse
endif

imap \\t <%=  %><LEFT><LEFT><LEFT>
imap \\h {{html  }}<LEFT><LEFT><LEFT>
imap \\p <?php  ?><LEFT><LEFT><LEFT>
map <C-F11> :tabp<CR>
map <C-F12> :tabn<CR>
map <D-[> :tabp<CR>
map <D-]> :tabn<CR>
map <S-T> :Rtree<CR>



let g:vimwiki_home = "/home/alan/wiki/"
let g:vimwiki_home_html = "/home/alan/wiki/html/"