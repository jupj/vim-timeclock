if !exists("g:timeclock_fmt")
    let g:timeclock_fmt = "%Y-%m-%d %H:%M"
endif

" timeclock#in() appends an "i" line with the current timestamp to the end of
" the file and leaves the editor in INSERT mode for the user to enter the
" account.
function! timeclock#in()
    call append("$", "i " .. strftime(g:timeclock_fmt) .. " ")
    normal! G
    startinsert!
endfunction

" timeclock#out() appends an "o" line with the current timestamp to the end of
" the file.
function! timeclock#out()
    call append("$", "o " .. strftime(g:timeclock_fmt))
    normal! G
endfunction

" timeclock#switch() is the equivalent of calling timeclock#out() followed by
" timeclock#in() with identical timestamps.
function! timeclock#switch()
    let l:timestamp = strftime(g:timeclock_fmt)
    call append(line('$'), "o " .. strftime(l:timestamp))
    call append(line('$'), "i " .. strftime(l:timestamp) .. " ")
    normal! G
    startinsert!
endfunction
