set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
        let s = '' " complete tabline goes here
        " loop through each tab page
        for t in range(tabpagenr('$'))
                let tab = t + 1
                let winnr = tabpagewinnr(tab)
                let buflist = tabpagebuflist(tab)
                let bufnr = buflist[winnr - 1]
                " set highlight
                if tab == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " set the tab page number (for mouse clicks)
                let s .= '%' . (tab) . 'T'
                let s .= ' '
                " set page number string
                let s .= tab . ' '
                " get buffer names and statuses
                let n = ''      "temp string for buffer names while we loop and check buftype
                let m = 0       " &modified counter
                let bc = len(buflist)     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in buflist
                        " buffer types: quickfix gets a [Q], help gets [H]{base fname}
                        " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
                        if b == bufnr
                          if getbufvar( b, "&buftype" ) == 'help'
                                  let n = '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                          elseif getbufvar( b, "&buftype" ) == 'quickfix'
                                  let n = '[Q]'
                          else
                                  "let n = pathshorten(bufname(b))
                                  let n = fnamemodify(bufname(b), ':t')
                          endif
                        endif
                        " check and ++ tab's &modified count
                        if getbufvar( b, "&modified" )
                                let m += 1
                        endif
                        " no final ' ' added...formatting looks better done later
                        "if bc > 1
                                "let n .= ' '
                        "endif
                        let bc -= 1
                endfor
                " add modified label [n+] where n pages in tab are modified
                if m > 0
                        let s .= '+ '
                endif
                " select the highlighting for the buffer names
                " my default highlighting only underlines the active tab
                " buffer names.
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " add buffer names
                if n == ''
                        let s.= '[New]'
                else
                        let s .= n
                endif
                " switch to no underlining and add final space to buffer list
                let s .= ' '
        endfor
        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'
        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
                let s .= '%=%#TabLineFill#%999Xx'
        endif
        return s
endfunction
