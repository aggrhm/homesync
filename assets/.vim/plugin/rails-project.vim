" File: rails-project.vim
" Author: Alan Graham
" Version: 1.0
" ============ RAILS PROJECT ====================
" Open a rails project using the rails.vim plugin
" Just include a file in your rails app folder with the files
" you want to open and call :RailsProject .your-rails-project-file
"

"------------- COMMANDS --------------
command! -nargs=? -bar -complete=file RailsProject :call OpenProject(<q-args>)

"------------- FUNCTIONS -------------
function! OpenProject (filename)
	set lines=45 columns=125
	execute ":e" a:filename
	let lines = getline(1, "$")
	let index = len(lines) - 1
	while index > 0
		let line = lines[index]
		execute ":tabe" line
		execute ":Rtree"
		execute "normal \<c-w>l"
		execute ":tabprev"
		let index = index - 1
	endwhile
	execute ":e" lines[0]
	execute ":Rtree"
	execute "normal \<c-w>l"
endfunction
