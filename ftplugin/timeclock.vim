command! TimeclockIn call timeclock#in()
command! TimeclockOut call timeclock#out()
command! TimeclockSwitch call timeclock#switch()

nnoremap <buffer> <localleader>i :TimeclockIn<cr>
nnoremap <buffer> <localleader>o :TimeclockOut<cr>
nnoremap <buffer> <localleader>s :TimeclockSwitch<cr>
