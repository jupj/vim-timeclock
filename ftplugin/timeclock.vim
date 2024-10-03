if !exists("g:timeclock_fmt")
    let g:timeclock_fmt = "%Y-%m-%d %H:%M"
endif

command! -nargs=1 TimeclockIn call timeclock#in(<f-args>)
command! -nargs=1 TimeclockOut call timeclock#out(<f-args>)
command! -nargs=1 TimeclockSwitch call timeclock#switch(<f-args>)

nnoremap <buffer> <localleader>i :TimeclockIn <c-r>=strftime(g:timeclock_fmt)<cr>
nnoremap <buffer> <localleader>o :TimeclockOut <c-r>=strftime(g:timeclock_fmt)<cr>
nnoremap <buffer> <localleader>s :TimeclockSwitch <c-r>=strftime(g:timeclock_fmt)<cr>
