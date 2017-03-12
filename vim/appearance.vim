" colorscheme
if has("gui_running") && (&t_Co > 2)
    set cursorline      " highlight current line
    set guioptions-=T "get rid of toolbar
    set guioptions-=m "get rid of menu
    set background=dark
    colorscheme apprentice
    if has("gui_gtk2")
        set guifont=Monospace\ 14
    elseif has("x11")
        set guifont=--xos4-terminus-medium-*-*-*-16-*-koi8-r
    else
        set guifont=Monospace:h14:cDEFAULT
    endif
    hi Tabs guibg=#88e088 guifg=#000000 gui=none
    hi LongLines guibg=#88e088 guifg=#000000 gui=none
    hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
else
    set background=dark
    colorscheme apprentice
    set guifont=Monospace \ 14
    hi Tabs guibg=#88e088 guifg=#000000 gui=none
    hi LongLines guibg=#88e088 guifg=#000000 gui=none
endif
