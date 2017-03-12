function! s:ctags_gen()
    execute '!ctags -R --c++-kinds=+p --langmap=c:.c.pc,c++:.c++.cc.cpp.cxx.h.h++.hh.hp.hpp.hxx.C.H.pcc --fields=+ianS  --extra=+q .'
    execute '!cscope -b -k -R'
endfun
command! -nargs=0 Ctags call s:ctags_gen()
