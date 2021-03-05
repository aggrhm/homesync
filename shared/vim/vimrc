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
	filetype on
	filetype off

	let g:loaded_logipat = 1
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ackprg = 'ag --vimgrep'
  let g:airline_theme = 'bubblegum'
  let g:airline_section_c = '%t'
  let g:airline_section_y = ''
  let g:airline_section_z = "%p%% %#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L"
  let g:airline_skip_empty_sections = 1
  let g:airline#extensions#tabline#enabled = 0
  "let g:airline#extensions#tabline#show_tabs = 0
  let g:airline#extensions#tabline#show_tab_count = 0
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tabline#tab_nr_type = 1
  let g:airline#extensions#tabline#show_tab_type = 0
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline#extensions#tabline#right_sep = ''
  let g:airline#extensions#tabline#right_alt_sep = ''
  let NERDTreeQuitOnOpen = 1


	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	Plugin 'gmarik/Vundle.vim'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'ekalinin/Dockerfile.vim'
	Plugin 'kchmck/vim-coffee-script'
	Plugin 'dbakker/vim-projectroot'
	Plugin 'groenewege/vim-less'
	Plugin 'keith/swift.vim'
	Plugin 'pangloss/vim-javascript'
	Plugin 'mxw/vim-jsx'
	Plugin 'agquick/autosession.vim'
  Plugin 'posva/vim-vue'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'mileszs/ack.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'preservim/nerdtree'
  "Plugin 'wting/gitsessions.vim'
  "Plugin 'flazz/vim-colorschemes'

	call vundle#end()
	filetype plugin indent on

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
  set sessionoptions-=curdir
	"set guifont=Courier\ 10\ Pitch\ 10
	if has("gui_macvim")
		set guifont=Monaco:h12
	else
		set guifont=Monospace\ 10
	end

	" Don't use Ex mode, use Q for formatting
	map Q gq

	" This is an alternative that also works in block mode, but the deleted
	" text is lost and it only works for putting the current register.
	"vnoremap p "_dp


	" Set shift width (indent) to 4 spaces
	set expandtab
	set shiftwidth=2
	set softtabstop=2
	set ts=2

	" Uncomment this line to turn off backup files
	set nobackup
  set nowritebackup
  set noswapfile
	set dir=~/.vim/backup//

	" Switch syntax highlighting on, when the terminal has colors
	" Also switch on highlighting the last used search pattern.
	if &t_Co > 2 || has("gui_running")
	  syntax enable
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
	  autocmd FileType ruby setlocal expandtab
	  autocmd FileType haml setlocal expandtab
		autocmd FileType swift setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4 
		autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2 
	  autocmd FileType go setlocal noexpandtab

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

	au BufRead,BufNewFile *.md set filetype=markdown
	au BufRead,BufNewFile *.jhaml set filetype=haml
	au BufRead,BufNewFile *.jhtml set filetype=html
	au BufRead,BufNewFile *.qsc set filetype=coffee
	au BufRead,BufNewFile *.qsj set filetype=javascript

	" automatically source vim sessions so I can open them with the finder
	set sessionoptions+=resize,winpos
	au BufRead *.vis so %

autocmd BufEnter * :cd %:p:h
"set autochdir

let g:netrw_nobeval = 1

if has("gui_running")
	if bufnr('$') == 1
		set co=80
		set lines=40
	end
	set noballooneval
  " for solarized
  set background=dark
  let g:solarized_contrast = "high"

	colors codeschoolplus
	"colors eclipse
	"colors PaperColor
  set fillchars+=vert:\ 
endif

let g:jsx_ext_required = 0

imap \\t <%=  %><LEFT><LEFT><LEFT>
imap \\a {{  }}<LEFT><LEFT><LEFT>
imap \\d data-bind=""<LEFT>
imap \\h {{html  }}<LEFT><LEFT><LEFT>
imap \\p <?php  ?><LEFT><LEFT><LEFT>
map <M-[> :tabp<CR>
map <M-]> :tabn<CR>
map <D-[> :tabp<CR>
map <D-]> :tabn<CR>
map <S-T> :Rtree<CR>
map \\b :set expandtab<bar>retab!<CR>
map \\w :set co=205<CR>

map <expr> ,s ':AutoSessionSave '.projectroot#guess().'/.vimsession'
map <expr> ,l ':AutoSessionLoad '.projectroot#guess().'/.vimsession'
map ,e :CtrlP<CR>
map ,n :set invnumber<CR>
map ,f :DirGrep 
map ,t :NERDTreeFind<CR>
map ,tc :NERDTreeClose<CR>
"set runtimepath^=~/.vim/bundle/ctrlp.vim

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

function! g:DirGrep(...)
  let l:query = get(a:, 1, 'query')
  let l:ext = get(a:, 2, '.rb')
  "execute "cd " . projectroot#guess()
  "execute 'grep -r -i "' . l:query . '" `git ls-files \| grep ' . l:ext . '`'
  execute "Ack " . l:query . " " . projectroot#guess()
endfunction
command! -nargs=+ -complete=file DirGrep call g:DirGrep(<f-args>)

