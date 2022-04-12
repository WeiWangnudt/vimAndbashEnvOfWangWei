set syntax=on
syntax enable

set ruler
set nu
set showmatch

set foldenable
set foldmethod=marker
"set foldclose=all
set fmr={{{,}}} fdl=1 fdls=-1 
highlight Folded ctermfg=white ctermbg=darkgray
highlight FoldColumn ctermfg=white ctermbg=darkgray
highlight Folded guifg=white guibg=LightGrey
highlight FoldColumn guifg=white guibg=LightGrey
hi clear Folded
hi clear FoldedColum

set autoindent
set smartindent
set shiftwidth=2 tabstop=2
set smarttab expandtab

set clipboard=unnamed

set iskeyword+=:,-,_

set showmatch
set matchtime=2

set wrap
set nolist
set lbr
set wm=0
set tw=0

set wmnu
set wildmode=longest,list,full

set backspace=2

set acd

set ignorecase                                                                  " Igore case when searching "
set smartcase                                                                   " Smart Case Matching "
set hlsearch                                                                    " Highlight Searching Things // hls "
set incsearch                                                                   " Search As You Are Typing "

set cursorline
set culopt=number
hi CursorLineNr ctermfg=red ctermbg=white
"hi CursorLine cterm=underline
"hi CursorLine cterm=underline ctermbg=darkgray ctermfg=white guibg=darkgray guifg=white
"highlight  Cursor ctermfg=white ctermbg=blue
"highlight iCursor guifg=white guibg=blue

set ff=unix

set encoding=utf-8
set fenc=utf-8 "gb2312,gbk,gb18030,big5
set termencoding=utf-8
scriptencoding utf-8

if(isGvim)
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
endif

if(isGUI)
  set guicursor=n-v-c:block-Cursor
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkon0
  set guicursor+=i:blinkwait10
  "set go=ae
  set guifont=DejaVu_Sans_Mono:h16:cANSI:qDRAFT
endif

