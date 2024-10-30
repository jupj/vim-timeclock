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

" timeclock#copy() copies the timestamp from the current line and inserts a
" new line with the opposite "i/o" and the same timestamp.
function! timeclock#copy()
    let m = matchlist(getline('.'), '\v^([io])\s+(\d\S+\s+\d\S+)')
    if len(m) == 0
        echom "Not a i/o line"
        return
    endif

    let type = m[1]
    let timestamp = m[2]

    " Reverse the "i/o" type
    if type == "i"
        let type = "o"
    else
        let type = "i"
    endif

    call append(line('.'), type .. ' ' .. timestamp)

    " Move to the new line and enter insert mode
    normal! j
    startinsert!
endfunction

" s:listAccounts() returns a list of all accounts in the current buffer
function! s:listAccounts()
    " use dict keys as the set of accounts
    let accounts = {}

    for line in getline(1, line("$"))
        let account = matchstr(line, '\v^i \d\S+ \d\S+\s+\zs\S+( \S+)*>')
        if account != ""
            let accounts[account] = 1
        endif
    endfor

    return sort(keys(accounts))
endfunction

" timeclock#complete() is a completion function for account names
function! timeclock#complete(findstart, base)
    if a:findstart
        let start = matchend(getline('.'), '\v^i \d\S+ \d\S+\s+<')
        if start < 0
            " no match, leave completion mode
            return -3
        endif
        return start
    endif

    let matches = matchfuzzy(s:listAccounts(), a:base)
    " keep base string as an option
    call add(matches, a:base)
    return matches
endfunction
