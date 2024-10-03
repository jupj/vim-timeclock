" timeclock#in() appends an "i" line with the timestamp to the end of
" the file and leaves the editor in INSERT mode for the user to enter the
" account.
function! timeclock#in(timestamp)
    call append("$", "i " .. a:timestamp .. " ")
    normal! G
    startinsert!
endfunction

" timeclock#out() appends an "o" line with the timestamp to the end of
" the file.
function! timeclock#out(timestamp)
    call append("$", "o " .. a:timestamp)
    normal! G
endfunction

" timeclock#switch() appends and "o" line followed by an "i" line.
function! timeclock#switch(timestamp)
    call timeclock#out(a:timestamp)
    call timeclock#in(a:timestamp)
endfunction
