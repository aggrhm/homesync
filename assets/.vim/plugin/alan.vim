" File: alan.vim
" Author: Alan Graham
" Version: 1.0
" ========== MY PLUGIN ==========
" These are some functions and commands I thought were useful.
" Feel free to add more...
"


" ---------- MAPPINGS ----------
" FACT Mappings
map <S-F8> :source! /osi/common/home/scrubHeaderScript.html<CR>
map <S-F9> :source! /osi/common/home/scrubHeaderScript.make<CR>
"map <S-F11> :source! /osi/common/home/scrubHeaderScript.java<CR>
"map <S-F12> :source! /osi/common/home/scrubHeaderScript.C<CR>
map <S-F11> gg<S-o><ESC>:r /home/alan/.vim/templates/MAKE_HEADER.txt<CR><UP>dd
map <S-F12> gg<S-o><ESC>:r /home/alan/.vim/templates/C_HEADER.txt<CR><UP>dd
map <S-F4> :!ct unco %
map <S-F5> :!ct co -nc %
map <S-F6> :!ct ci -c "" %<LEFT><LEFT><LEFT>
"map <S-F7> :split b<CR>:read !grep  ~/.indexODODODODODODODODOD
map <S-F7> :set co+=80 \| vert diffsplit %@@/
map <S-F3> :!xlsvtree % &<CR>
map <S-F2> :!ct co -nc %:h; ct mkelem -nc %<CR>
map <S-F10> :TlistToggle<CR>

map \\f b"+ywmgO <ESC>"ay0dd<UP>:r ~/.vim/templates/CT_FUNCTION.txt<CR>"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>?FUNCTIONNAME<CR>dW"+pbgUw`g<UP><UP><UP><UP><UP><UP>d4d`g
map \\d b"+ywmgO <ESC>"ay0dd<UP>:r ~/.vim/templates/CT_FUNCTION.txt<CR>"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>?FUNCTIONNAME<CR>dW"+pbgUw`g<UP><UP><UP><UP><UP><UP><UP>d6d`g
map \\c b"+ywmgO <ESC>"ay0dd<UP>:r ~/.vim/templates/CT_CLASS.txt<CR>"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>?FUNCTIONNAME<CR>dW"+pbgUw`g<UP><UP><UP><UP><UP><UP>d4d`g
map \\v b"+ywmgO <ESC>"ay0dd<UP>:r ~/.vim/templates/CT_FUNCTION.txt<CR>"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>0"a[p<DOWN>?FUNCTIONNAME<CR>dW"+pbgUw`g
map \\e :set co+=80 \| vsplit<CR><C-W>L:o 
map \\q :q \| set co-=81<CR><C-W>=
map \\r :set co=80 \| set lines=60<CR>
map \\s :so ~/.vim/plugin/alan.vim<CR>:so ~/.vim/plugin/rails-project.vim<CR>
map \\z :set guifont=Monospace\ 8<CR>
map \\h :OH %:p<CR>
map \\m :if &guioptions=~'m' \| set guioptions-=m \| else \| set guioptions+=m \| endif<cr> 
map \\o :RailsProject .rails-project<CR>

map <C-F1> <C-W>W
map <C-F2> <C-W>w
map <C-F6> :!ct merge -graphical -to % -version /main/`ct pwv -short`/LATEST /main/sys5/LATEST

"autocmd BufEnter * :cd %:p:h
set path+=**

" ---------- COMMANDS ----------
command! -nargs=? -bar -complete=file Se :call SplitOpen(<q-args>)
command! -nargs=? -bar -complete=file New :call NewPageH(<q-args>)
command! -nargs=? -bar -complete=file OH :call OpenHeader(<q-args>)
command! -nargs=? -bar -complete=file FindC :call FindInVob(<q-args>, "common")
command! -nargs=? -bar -complete=file FindT :call FindInVob(<q-args>, "tracker")
command! -nargs=? -bar -complete=file FindH :call FindHere(<q-args>)
command! -nargs=* -bar -complete=file Find :call FindInVob(<f-args>)


" ---------- FUNCTIONS ----------
function! SplitOpen (filename)
	set co+=81
	execute "vsplit" a:filename
	execute "normal! \<C-W>L"
endfunction

function! SwitchOpen (filename)
	execute "normal! \<C-W>w"
	execute "e " a:filename
endfunction

function! NewPage (filename)
	tabe
	"vnew
	execute "vsplit" a:filename
endfunction

function! NewPageH (filename)
	if a:filename ==? ""
		call NewPage(a:filename)
		return
	else
		let fullfile = fnamemodify(a:filename, ":p")
		call NewPage(fullfile)
		let header = FindHeader(fullfile)
		echo header
		if filereadable(header)
			call SwitchOpen(header)
		else
			echo "Header could not be opened."
		endif

	endif
endfunction

function! OpenHeader (file)
	"look in current dir
	let header = fnamemodify(a:file, ":r") . ".H"
	let header_loc = findfile(header)
	if filereadable(header_loc)
		call SplitOpen(header_loc)
		return
	endif

	"otherwise look in include dir
	let header = fnamemodify(header, ":s?lib?include?")
	let header_loc = findfile(header)
	if filereadable(header_loc)
		call SplitOpen(header_loc)
		return
	endif

	"couldn't find
	echo "Cannot find header for " a:file
		
endfunction

function! FindHeader (file)
	"check extension
	let ext = fnamemodify(a:file, ":e")
	if ext ==? "H"
		return ""
	endif

	"look in current dir
	let header = fnamemodify(a:file, ":r") . ".H"
	let header_loc = findfile(header)
	if filereadable(header_loc)
		return header_loc
	endif

	"otherwise look in include dir
	let header = fnamemodify(header, ":s?lib?include?")
	let header_loc = findfile(header)
	if filereadable(header_loc)
		return header_loc
	endif

	"couldn't find
	return ""
		
endfunction

function! FindInVob(name, vob)
	"search common vob include
	echo "Searching "a:vob" include..."
	let file = findfile(a:name, "/osi/" . a:vob . "/vob/include/**")
	if filereadable(file)
		execute ":e" file
		return
	endif
	"search common vob lib
	echo "Searching "a:vob" lib..."
	let file = findfile(a:name, "/osi/" . a:vob . "/vob/lib/**")
	if filereadable(file)
		execute ":e" file
		return
	endif
	"search common vob bin
	echo "Searching "a:vob" bin..."
	let file = findfile(a:name, "/osi/" . a:vob . "/vob/bin/**")
	if filereadable(file)
		execute ":e" file
		return
	endif
	echo "Couldn't find file!"
endfunction

function! FindInDir(name, dir)
	"search common vob include
	echo "Searching "a:dir
	let file = findfile(a:name, a:dir .  "/**")
	if filereadable(file)
		execute ":e" file
		return
	endif
	echo "Couldn't find file!"
endfunction

function! FindHere(name)
	let pwd = getcwd()
	call FindInDir(a:name, pwd)
endfunction
