" timeclock#in() appends an "i" line to the end of the file.
function! timeclock#in(entry)
    call append("$", "i " .. a:entry)
    normal! G
endfunction

" timeclock#out() appends an "o" line to the end of the file.
function! timeclock#out(entry)
    call append("$", "o " .. a:entry)
    normal! G
endfunction

" timeclock#switch() appends and "o" line followed by an "i" line.
" It uses only the timestamp for "o" and the entire input for "i".
function! timeclock#switch(entry)
    let l:timestamp = a:entry->slice(0, matchend(a:entry, '^\d\d\d\d.\d\d.\d\d \d\d:\d\d'))
    call timeclock#out(l:timestamp)

    call timeclock#in(a:entry)
endfunction
