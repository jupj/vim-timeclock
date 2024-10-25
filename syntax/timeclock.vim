if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "timeclock"

syntax match timeclockComment "\v^\s*[#;*].*$"

syntax match timeclockType "\v^[io] " nextgroup=timeclockTimestamp
syntax match timeclockTimestamp "\v\d\S+ \d\S+" contained nextgroup=timeclockAccount,timeclockNote
syntax match timeclockAccount "\v \S+( \S+)*" contained nextgroup=timeclockPayee,timeclockNote
syntax match timeclockPayee "\v  [^;]*" contained nextgroup=timeclockNote
syntax match timeclockNote "\v\s*;.*$" contained nextgroup=timeclockNote

highlight link timeclockComment Comment
highlight link timeclockType Type
highlight link timeclockTimestamp Constant
highlight link timeclockAccount Identifier
highlight link timeclockNote Tag
