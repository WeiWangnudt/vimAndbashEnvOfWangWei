" Head Settings: ------------------------{{{
" start
set nocompatible
let g:isWindows=0
let g:isGvim=0
let g:isLinux=0
let g:isGUI=0
" Internal Func Redefinitions: ----{{{
" start
function! ToggleVerbose()
  if !&verbose
    set verbosefile=$VIMVERBOSE
    set verbose=15
  else
    set verbose=0
    set verbosefile=
  endif
endfunction
"                                 end
"----------------------------------}}}
"                                       end
"----------------------------------------}}}

let $USRNAME='WANGWei'
let $USREMAIL='wangw111@icloud.com'

"----------------------------------------------------"+-------------------+--------------------------]
" Usr Prefer and Mannual Setting:                    "|     PackName      |       Depended by        |
" start----------------------------------------------"+-------------------+--------------------------+
let g:WindowFlexible=0 "                              |                   |                          |
let g:isWSL=1 "                                       |                   |                          |
let g:OSlanguage=$LANG "                              |                   |                          |
let g:AirLineThemeName='simple' "                     |                   |                          |
" Packadd Option :                                    |                   |                          |
let g:addOnVimCdoc=1 "                                |vimcdoc            |                          |
let g:addOnAirLine=1 "                                |vim-airline        |                          |
let g:addOnAirLineThemes=addOnAirLine "               |vim-airline-themes |vim-airline               |
let g:addOnColorsSolarized=0 "                        |vim-airline-themes |vim-airline               |
let g:addOnIndentLine=1 "                             |indentLine         |                          |
let g:addOnVimRainbow=1 "                             |vim-rainbow        |                          |
let g:addOnVimSurround=1 "                            |vim-surround       |                          |
let g:addOnTrinity=1 "                                |Trinity            |                          |
let g:addOnNERDTree=1 "                               |nerdtree           |                          |
let g:addOnTagList=1 "                                |taglist            |                          |
let g:addOnSrcExpl=1 "                                |SrcExpl            |                          |
let g:addOnBufExplorer=1 "                            |bufexplorer        |                          |
let g:addOnNeocomplcache=1 "                          |neocomplcache      |                          |
let g:addOnNeoSnippet=1 "                             |neosnippet         |                          |
let g:addOnNeoSnippetSnippets=addOnNeoSnippet "       |neosnippet-snippets|neosnippet                |
let g:addOnVimSnipMate=0 "                            |vim-snipmate       |                          |
let g:addOnVimSnippets=addOnVimSnipMate "             |vim-snippets       |SnipMate                  |
let g:addOnTlibvim=addOnVimSnipMate "                 |tlib_vim           |SnipMate                  |
let g:addOnVimAddonMwUtils=addOnVimSnipMate "         |vim-addon-mw-utils |SnipMate                  |
let g:addOnCodeTemplate=1 "                           |code-templates     |                          |
let g:addOnFugitive=1 "                               |fugitive           |                          |
let g:addOnVimFLog=1 "                                |vim-flog           |                          |
let g:addOnAnsiEsc=addOnVimFLog "                     |AnsiEsc            |                          |
let g:addOnGitGutter=1 "                              |vim-gitgutter      |                          |
let g:addOnGitSignify=1 "                             |git-signify        |                          |
let g:addOnOmniSharp=0 "                              |omnisharp          |                          |
let g:addOnSyntastic=1 "                              |syntastic          |                          |
"-----------------------------------------------------+-------------------+--------------------------+

if((has("win32") || has("win64")|| has("win95") || has("win16")))
"------------------------------------------------------------------+
" Platform Settings, Put Windows OS Settings Here: {{{             |
"------------------------------------------------------------------+
" start
  let g:isWindows=1
  if(has("gui_running"))
    let g:isGvim=1
    let g:isGUI=1
  endif
  set shell=pwsh.exe
  set shellcmdflag=-Command
  "set shellquote="\{"
  "set shellxquote="\{"
  "set shellpipe=2>&1
  "set shellredir=2>&1
  "set term=$win32
  set helplang=en
  let $VIMHOME=$HOME.'\vimfiles'
  let $USR_VIMFILES_DIR=$VIMHOME.'/.vim'
  let $EXUBERANT_CTAGS_PATH='C:\Users\wangw\local\bin\ctags.exe'
  let $GIT_EXE_PATH='C:\Program Files\Git\cmd\git.exe'
  let $BROWSWERPATH='start msedge'
  let $VIMTEMP_DIR=$USR_VIMFILES_DIR.'/_tmp'
"                                                            }}} end
" -----------------------------------------------------------------+
elseif has("linux")
"------------------------------------------------------------------+
" Platform Settings, Put Linux OS Settings Here: {{{               |
"------------------------------------------------------------------+
" start
  let g:isLinux = 1
  if(has("gui_running"))
    let g:isGUI = 1
  endif
  set shell=$SHELL
  "set shellcmdflag=-c
  set term=$TERM
  set helplang=en
  let $VIMHOME=$HOME.'/.vim'
  let $USR_VIMFILES_DIR=$VIMHOME
  let $EXUBERANT_CTAGS_PATH='/usr/bin/ctags'
  let $GIT_EXE_PATH='/usr/bin/git'
  let $BROWSWERPATH='firefox'
  let $VIMTEMP_DIR=$VIMHOME.'/_tmp'
"                                                            }}} end
" -----------------------------------------------------------------+
endif

" Add Basic Settings
" language messages "OSlanguage" "zh_CN.utf-8, C.UTF-8,en_US.UTF-8
source $USR_VIMFILES_DIR/configur_files/basicSettings.vim

" Runtime Directories Generic Settings: --------------------{{{
" start
let $VIMVERBOSE_DIR=$VIMTEMP_DIR
let $VIMSESSION_DIR=$VIMTEMP_DIR

let $VIMVERBOSE=$VIMTEMP_DIR.'/verbose.log'
let $VIMSESSION=$VIMTEMP_DIR.'/Session.vim'

let $USRPACKS_DIR=$USR_VIMFILES_DIR.'/pack'
let $USRPACKS_OPT_DIR=$USRPACKS_DIR.'/vendor/opt'
let $USRPACKS_START_DIR=$USRPACKS_DIR.'/vendor/start'
let $USRPACKS_BY_THIRD_MANAGER=$USRPACKS_DIR.'/by3rdManager'
"                                                          end
" ----------------------------------------------------------}}}

" Runtime and Pack Path Generic Settings: ------------------{{{
" start
set pp+=$USR_VIMFILES_DIR
set rtp+=$USRPACKS_START_DIR
set rtp+=$VIMTEMP_DIR
"                                                          end
" ----------------------------------------------------------}}}

if (!isdirectory($VIMTEMP_DIR))
" First Running Reminder and Author Info: ------------------{{{
" start
  if isGvim
    echomsg "Please launch vim from Powershell at first runing!"
    exit
  elseif !isGvim && isWindows
    :!date;
      \Write-Host 'VIM First Running in Powershell\!' -ForegroundColor red -BackgroundColor white;
      \Write-Host 'Configurator: WANGWei' -ForegroundColor DarkBlue;
      \Write-Host 'Organization: College of Computer Science and Technology`, National University of Defense Technology'
        \ -ForegroundColor DarkBlue;
      \Write-Host 'Contacts:     E-mail: wangw111@icloud.com' -ForegroundColor DarkBlue
  elseif isLinux
    echomsg "VIM First Running in Linux!"
    echomsg "Configurator: WANGWei"
    echomsg "Organization: College of Computer Science and Technology, National University of Defense Technology"
    echomsg "Contacts:     E-mail: wangw111@icloud.com"
  endif
"                                                          end
" ----------------------------------------------------------}}}
" Check Exuberant-ctags. Install, if not installed ---------{{{
  if !executable('ctags')
    if isWindows
      :!Write-Warning 'Exuberantctags not found`, installing...' -WarningAction Inquire;
          \Copy-Item -Path "$env:VIMHOME\.vim\external_exes\ctags.exe" -Destination "$env:HOME\local\bin\ctags.exe" -Force -Confirm
    elseif isLinux
      echomsg 'Exuberant-ctags not found, installing...'
      :!sudo apt install exuberant-ctags
    endif
  endif
"                                                          end
" ----------------------------------------------------------}}}
" Create Runtime Temp DIR, if not create -------------------{{{
  call mkdir($VIMTEMP_DIR)
" ----------------------------------------------------------}}}
endif

" Auto Command Settings
" Auto reload vimrc files as it's written {{{
au! BufWritePost $MYVIMRC source $MYVIMRC
" }}}
" Auto change to current directory {{{
au BufEnter * silent! lcd %:p:h
" }}}
" Auto change markdown file to tex fileformat {{{
au! BufEnter *.md set ft=tex
" }}}
" Auto restore file(s) of last work as running vim without arguments {{{
" defual: set ssop=blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal
set ssop-=options
set ssop-=terminal
set ssop-=help
set ssop-=blank
set ssop+=winpos
set ssop+=resize
autocmd VimLeave * nested if isdirectory($VIMSESSION_DIR) | execute "mksession! " . $VIMSESSION | endif
autocmd VimEnter * nested if argc() == 0 && filereadable($VIMSESSION) | execute "source " . $VIMSESSION | endif
" }}}
" Auto restore cursor position as re-openning the file {{{
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}

" Optional User Pack add on:
" VIMcdoc: -------------------------------------------{{{
" start
let g:isVimCdocAdd=0
" packadd: 
if addOnVimCdoc
  let $PACK_NAME="vimcdoc"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isVimCdocAdd=1
" pack settings: {{{
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
endif
"                                                    end
" ----------------------------------------------------}}}
" VimAirLine: ----------------------------------------{{{
" start
let g:isAirLineAdd=0
" packadd: 
if addOnAirLine
  let $PACK_NAME="vim-airline"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isAirLineAdd=1
" pack settings: {{{
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#formatter='unique_tail_improved'
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    " unicode symbols
    let g:airline_symbols.crypt = ''
    let g:airline_symbols.linenr = '?'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.paste = '?'
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.spell = 'SPELL'
    let g:airline_symbols.notexists = '?'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_theme=AirLineThemeName
    " }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" VimAirLineTheme: -----------------------------------{{{
" start
let g:isAirLineThemesAdd=0
" packadd: 
if addOnAirLineThemes
  let $PACK_NAME="vim-airline-themes"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isAirLineThemesAdd=1
" pack settings: {{{
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" ColorsSolarized: -----------------------------------{{{
" start
let g:isColorsSolarized=0
" packadd: 
if addOnColorsSolarized
  let $PACK_NAME="colors-solarized"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
   let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isColorsSolarized=1
" pack settings: {{{
    if has('gui_running')
      set background=dark
    else
      set background=dark
    endif
    colorscheme solarized
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" IndentLine: ----------------------------------------{{{
" start
let g:isIndentLineAdd=0
" packadd: 
if addOnIndentLine
  let $PACK_NAME="indentLine"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isIndentLineAdd=1
" pack settings: {{{
    let g:indentLine_char='|' " alternative: | ¦ ┆ │
    let g:indentLine_first_char='|'
    let g:indentLine_char_list=['|', '¦', '┆', '┊'] " Multilevel indent line
    let g:indentLine_setColors=1
    let g:indentLine_color_term=239
    " let g:indentLine_bgcolor_term=202
    let g:indentLine_color_gui='#A4E57E'
    " let g:indentLine_bgcolor_gui='#FF5F00'
    let g:indentLine_color_tty_light=7
    let g:indentLine_indentLevel=10
    let g:indentLine_faster=2
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" VimRainbow: ----------------------------------------{{{
" start
let g:isVimRainbowAdd=0
" packadd: 
if addOnVimRainbow
  let $PACK_NAME="vim-rainbow"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isVimRainbowAdd=1
" pack settings: {{{
  let g:rainbow_active = 1
  let g:rainbow_load_separately = [
      \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
      \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
      \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
      \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
      \ ]
  let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
  let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
  au FileType c,cpp,objc,objcpp,cs call rainbow#load()
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" VimSurround: ---------------------------------------{{{
" start
let g:isVimSurroundAdd=0
" packadd: 
if addOnVimSurround
  let $PACK_NAME="vim-surround"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isVimSurroundAdd=1
" pack settings: {{{
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" Trinity: -------------------------------------------{{{
" start
let g:isTrinityAdd=0
" packadd: 
if addOnTrinity
  let $PACK_NAME="Trinity"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isTrinityAdd=1
" pack settings: {{{
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" NERDTree: ------------------------------------------{{{
" start
let g:isNERDTreeAdd=0
" packadd: 
if addOnNERDTree
  let $PACK_NAME="nerdtree"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isNERDTreeAdd=1
" pack settings: {{{
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
    autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
        \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
    " Open the existing NERDTree on each new tab.
    autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
    "|loaded_nerd_tree|            Turns off the script.

    "|NERDTreeAutoCenter|          Controls whether the NERDTree window centers
    "                            when the cursor moves within a specified
    "                            distance to the top/bottom of the window.
    "
    "|NERDTreeAutoCenterThreshold| Controls the sensitivity of autocentering.
    "
    "|NERDTreeCaseSensitiveSort|   Tells the NERDTree whether to be case
    "                            sensitive or not when sorting nodes.
    "
    "|NERDTreeNaturalSort|         Tells the NERDTree whether to use natural sort
    "                            order or not when sorting nodes.
    "
    "|NERDTreeSortHiddenFirst|     Tells the NERDTree whether to take the dot at
    "                            the beginning of the hidden file names into
    "                            account when sorting nodes.
    "
    "|NERDTreeChDirMode|           Tells the NERDTree if/when it should change
    "                            vim's current working directory.
    "
    "|NERDTreeHighlightCursorline| Tell the NERDTree whether to highlight the
    "                            current cursor line.
    let NERDTreeHighlightCursorline=1
    "|NERDTreeHijackNetrw|         Tell the NERDTree whether to replace the netrw
    "                            autocommands for exploring local directories.
    "
    "|NERDTreeIgnore|              Tells the NERDTree which files to ignore.
    "
    "|NERDTreeRespectWildIgnore|   Tells the NERDTree to respect `'wildignore'`.
    "
    "|NERDTreeBookmarksFile|       Where the bookmarks are stored.
    "
    "|NERDTreeBookmarksSort|       Control how the Bookmark table is sorted.
    "
    "|NERDTreeMarkBookmarks|       Render bookmarked nodes with markers.
    "
    "|NERDTreeMouseMode|           Manage the interpretation of mouse clicks.
    "
    "|NERDTreeQuitOnOpen|          Closes the tree window or bookmark table after
    "                            opening a file.
    "
    "|NERDTreeShowBookmarks|       Tells the NERDTree whether to display the
    "                            bookmarks table on startup.
    "
    "|NERDTreeShowFiles|           Tells the NERDTree whether to display files in
    "                            the tree on startup.
    "
    "|NERDTreeShowHidden|          Tells the NERDTree whether to display hidden
    "                            files on startup.
    "
    "|NERDTreeShowLineNumbers|     Tells the NERDTree whether to display line
    "                            numbers in the tree window.
    "
    "|NERDTreeSortOrder|           Tell the NERDTree how to sort the nodes in the
    "                            tree.
    "
    "|NERDTreeStatusline|          Set a statusline for NERDTree windows.
    "
    "|NERDTreeWinPos|              Tells the script where to put the NERDTree
    "                            window, values: "left" or "right".
    let g:NERDTreeWinPos="left"
    "|NERDTreeWinSize|             Sets the window size when the NERDTree is
    "                            opened.
    let NERDTreeWinSize=18
    "|NERDTreeWinSizeMax|          Sets the maximum window size when the NERDTree
    "                            is zoomed.
    "
    "|NERDTreeMinimalUI|           Disables display of the 'Bookmarks' label and
    "                            'Press ? for help' text.
    "
    "|NERDTreeMinimalMenu|         Use a compact menu that fits on a single line
    "                            for adding, copying, deleting, etc
    "
    "|NERDTreeCascadeSingleChildDir|
    "                            Collapses on the same line directories that have
    "                            only one child directory.
    "
    "|NERDTreeCascadeOpenSingleChildDir|
    "                            Cascade open while selected directory has only
    "                            one child that also is a directory.
    "
    "|NERDTreeAutoDeleteBuffer|    Tells the NERDTree to automatically remove a
    "                            buffer when a file is being deleted or renamed
    "                            via a context menu command.
    "
    "|NERDTreeCreatePrefix|        Specify a prefix to be used when creating the
    "                            NERDTree window.
    "
    "|NERDTreeRemoveFileCmd|       Specify a custom shell command to be used when
    "                            deleting files. Note that it should include one
    "                            space character at the end of the command and it
    "                            applies only to files.
    "
    "|NERDTreeRemoveDirCmd|        Specify a custom shell command to be used when
    "                            deleting directories. Note that it should
    "                            include one space character at the end of the
    "                            command and it applies only to directories.
    "
    "|NERDTreeDirArrowCollapsible| These characters indicate when a directory is
    "|NERDTreeDirArrowExpandable|  either collapsible or expandable.
    "
    "|NERDTreeNodeDelimiter|       A single character that is used to separate the
    "                            file or directory name from the rest of the
    "                            characters on the line of text.
    "
    "|NERDTreeCustomOpenArgs|      A dictionary with values that control how a node
    "                            is opened with the |NERDTree-<CR>| key.
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" TagList: ------------------------------------------{{{
" start
let g:isTagListAdd=0
" packadd: 
if addOnTagList
  let $PACK_NAME="taglist"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isTagListAdd=1
" pack settings: {{{
    let Tlist_Auto_Highlight_Tag=1 " |Automatically highlight the current tag in the taglist.
    let Tlist_Auto_Open=0 " |Open the taglist window when Vim starts.
    let Tlist_Auto_Update=1 " |Automatically update the taglist to include newly edited files.
    let Tlist_Close_On_Select=0 " |Close the taglist window when a file or tag is selected.
    let Tlist_Compact_Format=1 " |Remove extra information and blank lines from the taglist window.
    let Tlist_Ctags_Cmd=$EXUBERANT_CTAGS_PATH "|Specifies the path to the ctags utility.
    let Tlist_Display_Prototype=0 " |Show prototypes and not tags in the taglist window.
    let Tlist_Display_Tag_Scope=1 " |Show tag scope next to the tag name.
    let Tlist_Enable_Fold_Column=1 " |Show the fold indicator column in the taglist window.
    let Tlist_Exit_OnlyWindow=1 " |Close Vim if the taglist is the only window.
    let Tlist_File_Fold_Auto_Close=1 " |Close tag folds for inactive buffers.
    let Tlist_GainFocus_On_ToggleOpen=0 " |Jump to taglist window on open.
    let Tlist_Highlight_Tag_On_BufEnter=1 " |On entering a buffer, automatically highlight the current tag.
    if WindowFlexible
      let Tlist_Inc_Winwidth=1 " |Increase the Vim window width to accommodate the taglist window.
    else
      let Tlist_Inc_Winwidth=0 " |Windows Terminal can not work well with this option.
    endif
    let Tlist_Max_Submenu_Items=10 " |Maximum number of items in a tags sub-menu.
    let Tlist_Max_Tag_Length=25 " |Maximum tag length used in a tag menu entry.
    let Tlist_Process_File_Always=0 " |Process files even when the taglist window is closed.
    let Tlist_Show_Menu=1 " |Display the tags menu.
    let Tlist_Show_One_File=1 " |Show tags for the current buffer only.
    let Tlist_Sort_Type='name' " |Sort method used for arranging the tags.
    let Tlist_Use_Horiz_Window=0 " |Use a horizontally split window for the taglist window.
    let Tlist_Use_Right_Window=1 " |Place the taglist window on the right side.
    let Tlist_Use_SingleClick=1 " |Single click on a tag jumps to it.
    let Tlist_WinHeight=10 " |Horizontally split taglist window height.
    let Tlist_WinWidth=35 " |Vertically split taglist window width.
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                   end
" ---------------------------------------------------}}}
" SrcExpl: -------------------------------------------{{{
" start
let g:isSrcExplAdd=0
" packadd: 
if addOnSrcExpl
  let $PACK_NAME="SrcExpl"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isSrcExplAdd=1
" pack settings: {{{
    let g:SrcExpl_isUpdateTags=0
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" BufExplorer: ---------------------------------------{{{
" start
let g:isBufExplorerAdd=0
" packadd: 
if addOnBufExplorer
  let $PACK_NAME="bufexplorer"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isBufExplorerAdd=1
" pack settings: {{{
    function BufExplorerToggle()
      if bufwinnr('BufExplorer') >= 1
        echo "Close BufExplorer!"
        bdelete BufExplorer
      else
        echo "Open BufExplorer!"
        BufExplorerHorizontalSplit
      endif
    endfunction

    " If set, bufexplorer will bring up the selected buffer in the window specified by g:bufExplorerChgWin.
    " let g:bufExplorerChgWin=
    " To control whether the default help is displayed or not, use: >
    let g:bufExplorerDefaultHelp=1       " Show default help.
     "To control whether the default key mappings are enabled or not, use: >
    let g:bufExplorerDisableDefaultKeyMapping=1    " Disable mapping.
    " To control whether detailed help is display by, use: >
    let g:bufExplorerDetailedHelp=0      " Do not show detailed help.
    " To control whether you are taken to the active window when selecting a buffer, use: >
    let g:bufExplorerFindActive=1        " Go to active window.
    " When a buffer is selected, the functions specified either singly or as a list will be called.
    " let g:bufExplorerFuncRef=
    " To control whether to sort the buffer in reverse order or not, use: >
    let g:bufExplorerReverseSort=0       " Do not sort in reverse order.
    " Directories usually show up in the list from using a command like ":e .".
    " To control whether to show directories in the buffer list or not, use: >
    let g:bufExplorerShowDirectories=1   " Show directories.
    " To control whether to show "No Name" buffers or not, use: >
    let g:bufExplorerShowNoName=1        " Show "No Name" buffers.
    " To control whether to show absolute paths or relative to the current directory, use: >
    " let g:bufExplorerShowRelativePath=0  " Show absolute paths.
    let g:bufExplorerShowRelativePath=1  " Show relative paths.
    " To control weither or not to show buffers on for the specific tab or not, use: >
    let g:bufExplorerShowTabBuffer=0        " No.
    " To control whether to show unlisted buffer or not, use: >
    let g:bufExplorerShowUnlisted=0      " Do not show unlisted buffers.
    " To control what field the buffers are sorted by, use: > The default is to sort by mru.
    let g:bufExplorerSortBy='extension'  " Sort by file extension.
    " let g:bufExplorerSortBy='fullpath'   " Sort by full file path name.
    " let g:bufExplorerSortBy='mru'        " Sort by most recently used.
    " let g:bufExplorerSortBy='name'       " Sort by the buffer's name.
    " let g:bufExplorerSortBy='number'     " Sort by the buffer's number.
    " To control where the new split window will be placed above or below the current window, use: >
    let g:bufExplorerSplitBelow=0        " Split new window above current.
    " To control the size of the new horizontal split window. use: >default is 0, so that the size is set by Vim.
    " let g:bufExplorerSplitHorzSize=0     " New split window size set by Vim.
    let g:bufExplorerSplitHorzSize=2     " New split window is n rows high.
    " To control whether to split out the path and file name or not, use: >
    let g:bufExplorerSplitOutPathName=1  " Split the path and file name.
    " To control where the new vsplit window will be placed to the left or right of current window, use: >
    let g:bufExplorerSplitRight=1        " Split right.
    " To control the size of the new vertical split window. use: > 0: new split windows size set by Vim.
    let g:bufExplorerVertSize=10          " New split window is n columns wide.
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" NeoComplcache: -------------------------------------{{{
" start
let g:isNeocomplcacheAdd=0
" packadd: 
if addOnNeocomplcache
  let $PACK_NAME="neocomplcache"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isNeocomplcacheAdd=1
" pack settings: {{{
    au BufEnter * silent! NeoComplCacheEnable
    " Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    " Control num of candidates displayed in pop-up menu
    let g:neocomplcache_max_list=20
    " Control num of auto input complete at time of key input.
    let g:neocomplcache_auto_completion_start_length=2
    " AutoComplPop like behavior.
    let g:neocomplcache_enable_auto_select = 1
    " Enable heavy features.
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " DIR of neocomplcache begin to write a file at one time.
    " Default is "$XDG_CACHE_HOME/neocomplcache" or "~/.cache/neocomplcache".
    let g:neocomplcache_temporary_dir=$VIMTEMP_DIR.'/neocomplcache'
    if !isdirectory(neocomplcache_temporary_dir) | call mkdir(neocomplcache_temporary_dir) | endif
    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $VIMTEMP_DIR.'/neocomplcache/dictionary_cache/vimshell_hist',
        \ 'scheme' : $VIMTEMP_DIR.'/neocomplcache/dictionary_cache/gosh_completions'
            \ }
    " Path to the ctags command
    let g:neocomplcache_ctags_program=$EXUBERANT_CTAGS_PATH
    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
    endif
    if !exists('g:neocomplcache_force_omni_patterns')
      let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php =
    \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
    let g:neocomplcache_omni_patterns.c =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
    let g:neocomplcache_omni_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplcache_omni_patterns.perl =
    \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" NeoSnippet: ----------------------------------------{{{
" start
let g:isNeoSnippetAdd=0
" packadd: 
if addOnNeoSnippet
  let $PACK_NAME="neosnippet"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isNeoSnippetAdd=1
" pack settings: {{{
    let g:neosnippet#enable_optional_arguments=0
    let g:neosnippet#data_directory=$VIMTEMP_DIR.'/neosnippet'
    let g:neosnippet#snippets_directory=$NEOSNIPPET_SNIPPETS_DIR
    set completeopt-=preview
    " For conceal markers.
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" NeoSnippet-snippets: -------------------------------{{{
" start
let g:isNeoSnippetSnippetsAdd=0
" packadd: 
if addOnNeoSnippetSnippets
  let $PACK_NAME="neosnippet-snippets"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let $NEOSNIPPET_SNIPPETS_DIR=$PACK_DIR.'/neosnippets'
    set rtp+=$PACK_DIR
    set rtp+=$NEOSNIPPET_SNIPPETS_DIR
    let g:isNeoSnippetSnippetsAdd=1
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" VimSnipMate: ---------------------------------------{{{
" start
let g:isVimSnipMateAdd=0
" packadd: 
if addOnVimSnipMate
  let $PACK_NAME="vim-snipmate"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isVimSnipMateAdd=1
" pack settings: {{{
    let g:snipMate.snippet_version=1
    let g:snips_author=$USRNAME
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" VimSnippets: ---------------------------------------{{{
" start
let g:isVimSnippetsAdd=0
" packadd: 
if addOnVimSnippets
  let $PACK_NAME="vim-snippets"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isVimSnippetsAdd=1
" pack settings: {{{
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" Tlib_vim: ------------------------------------------{{{
" start
let g:isTlibVimAdd=0
" packadd: 
if addOnTlibvim
  let $PACK_NAME="tlib_vim"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isTlibVimAdd=1
  else
    echo $PACK_NAME "not found, add on fail."
  endif
endif
"                                                    end
" ----------------------------------------------------}}}
" VimAddonMwUtils: -----------------------------------{{{
" start
let g:isVimAddonMwUtilsAdd=0
" packadd: 
if addOnVimAddonMwUtils
  let $PACK_NAME="vim-addon-mw-utils"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isVimAddonMwUtilsAdd=1
" pack settings: {{{
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" CodeTemplate: c-support bash-support .etc.----------{{{
" start
let g:isCodeTemplateAdd=0
" packadd: 
if addOnCodeTemplate
  let $PACK_NAME="code-templates"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isCodeTemplateAdd=1
" pack settings: {{{
    let g:C_UseTool_cmake='yes'
    let g:C_UseTool_doxygen='yes'
    let g:Templates_InternetBrowserExec=''
    if isGUI
      let g:Templates_InternetBrowserExec=$BROWSWERPATH
      let g:Templates_InternetBrowserFlags='--new-window'
    elseif isWindows
      let g:Templates_InternetBrowserExec=$BROWSWERPATH
      let g:Templates_InternetBrowserFlags=''
    endif
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" Fugitive: branch sign on Airline--------------------{{{
" start
let g:isFugitiveAdd=0
" packadd: 
if addOnFugitive
  let $PACK_NAME="fugitive"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isFugitiveAdd=1
" pack settings: {{{
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" VimFLog: -------------------------------------------{{{
" start
let g:isVimFLogAdd=0
" packadd: 
if addOnVimFLog
  let $PACK_NAME="vim-flog"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isVimFLogAdd=1
" pack settings: {{{
    let g:flog_use_ansi_esc=1
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" AnsiEsc: -------------------------------------------{{{
" start
let g:isAnsiEscAdd=0
" packadd: 
if addOnAnsiEsc
  let $PACK_NAME="AnsiEsc"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isAnsiEscAdd=1
" pack settings: {{{
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" Gitgutter: lines modify on left side .etc.-------{{{
" start
let g:isGitGutterAdd=0
" packadd: 
if addOnGitGutter
  let $PACK_NAME="vim-gitgutter"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isGitGutterAdd=1
" pack settings: {{{
    let g:gitgutter_git_executable=$GIT_EXE_PATH
    let g:gitgutter_sign_added='+'
    let g:gitgutter_sign_modified='~'
    let g:gitgutter_sign_removed='_'
    let g:gitgutter_sign_removed_first_line='‾'
    let g:gitgutter_sign_removed_above_and_below='_¯'
    let g:gitgutter_sign_modified_removed='~_'
    let g:gitgutter_set_sign_backgrounds=0
    highlight GitGutterAdd    guifg=#009900 ctermfg=2 ctermbg=none
    highlight GitGutterChange guifg=#bbbb00 ctermfg=3 ctermbg=none
    highlight GitGutterDelete guifg=#ff2222 ctermfg=1 ctermbg=none
    highlight clear SignColumn
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" GitSignify: sign of lines modify on left side-------{{{
" start
let g:isGitSignifyAdd=0
" packadd: 
if addOnGitSignify
  let $PACK_NAME="git-signify"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let g:isGitSignifyAdd=1
" pack settings: {{{
  let g:signify_number_highlight=0
  let g:signify_line_highlight = 0 " disable whole modifued line highlight, enable with "1"
  highlight clear SignColumn
  highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
  highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
  highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" OmniSharp: -----------------------------------------{{{
" start
let g:isOmniSharpAdd=0
" packadd: 
if addOnOmniSharp
  let $PACK_NAME="omnisharp"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isOmniSharpAdd=1
" pack settings: {{{
    if isWSL
      let g:OmniSharp_translate_cygwin_wsl=1
    endif
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
" Syntastic: -----------------------------------------{{{
" start
let g:isSyntasticAdd=0
" packadd: 
if addOnSyntastic
  let $PACK_NAME="syntastic"
  if (isdirectory($USRPACKS_OPT_DIR.'/'.$PACK_NAME))
    packadd $PACK_NAME
    let $PACK_DIR=$USRPACKS_OPT_DIR.'/'.$PACK_NAME
    let $PACK_DOC=finddir("doc", $PACK_DIR)
    if isdirectory($PACK_DOC) && !filereadable($PACK_DOC.'/tags') | helptags $PACK_DOC | endif
    let isSyntasticAdd=1
" pack settings: {{{
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
" }}}
  else
    echo $PACK_NAME "not found, add on fail."
  endif
" pack keymap and shortcut ->see Keymap Settings Below
endif
"                                                    end
" ----------------------------------------------------}}}
filetype plugin indent on
function PlugAddInfo()
  " {{{
  echo "isVimCdocAdd:"            g:isVimCdocAdd           
  echo "isAirLineAdd:"            g:isAirLineAdd           
  echo "isAirLineThemesAdd:"      g:isAirLineThemesAdd     
  echo "isColorsSolarized:"       g:isColorsSolarized     
  echo "isIndentLineAdd:"         g:isIndentLineAdd        
  echo "isVimRainbowAdd:"         g:isVimRainbowAdd        
  echo "isVimSurroundAdd:"        g:isVimSurroundAdd       
  echo "isTrinityAdd:"            g:isTrinityAdd           
  echo "isNERDTreeAdd:"           g:isNERDTreeAdd          
  echo "isTagListAdd:"            g:isTagListAdd           
  echo "isSrcExplAdd:"            g:isSrcExplAdd           
  echo "isBufExplorerAdd:"        g:isBufExplorerAdd       
  echo "isNeocomplcacheAdd:"      g:isNeocomplcacheAdd     
  echo "isNeoSnippetAdd:"         g:isNeoSnippetAdd        
  echo "isNeoSnippetSnippetsAdd:" g:isNeoSnippetSnippetsAdd
  echo "isVimSnipMateAdd:"        g:isVimSnipMateAdd       
  echo "isVimSnippetsAdd:"        g:isVimSnippetsAdd       
  echo "isTlibVimAdd:"            g:isTlibVimAdd           
  echo "isVimAddonMwUtilsAdd:"    g:isVimAddonMwUtilsAdd   
  echo "isCodeTemplateAdd:"       g:isCodeTemplateAdd      
  echo "isFugitiveAdd:"           g:isFugitiveAdd          
  echo "isVimFLogAdd:"            g:isVimFLogAdd           
  echo "isAnsiEscAdd:"            g:isAnsiEscAdd           
  echo "isGitGutterAdd:"          g:isGitGutterAdd         
  echo "isGitSignifyAdd:"         g:isGitSignifyAdd        
  echo "isOmniSharpAdd:"          g:isOmniSharpAdd         
  echo "isSyntasticAdd:"          g:isSyntasticAdd         
  " }}}
endfunction
command ShowPlugAddInfo :call PlugAddInfo()

"------------------------------------------------------------------+
" Platform Settings, Put Windows OS Settings Here: {{{             |
"------------------------------------------------------------------+
" start
" Key Maps and User Command:
if isGvim
  " Toggle Menu and Toolbar
  set guioptions-=m
  set guioptions-=T
  map <silent> <F3> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
        \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
        \endif<CR>
endif
if isTrinityAdd
  nnoremap <silent> <leader>wa :TrinityToggleAll<CR>
endif
if isNERDTreeAdd
  nnoremap <silent> <leader>ntf :NERDTreeFind<CR>
  nnoremap <silent> <C-n>  :NERDTreeToggle<CR> :echo "Press \"m\" for Operation Tips"<CR>
endif
if isTagListAdd
  nnoremap <silent> <leader>tlu :TlistUpdate<CR>
  nnoremap <silent> <C-t> :TlistToggle<CR>
endif
if isSrcExplAdd
  nnoremap <silent> <C-e>  :SrcExplToggle<CR>
endif
if isBufExplorerAdd
  nnoremap <silent> <C-b> :call BufExplorerToggle()<CR>
  nnoremap <silent> <leader>bev :BufExplorerVerticalSplit<CR>
endif
if isNeocomplcacheAdd
  nnoremap <leader>nc :NeoComplCacheToggle<CR>
  nnoremap <leader>ncl :NeoComplCacheClean<CR>
endif
if isNeoSnippetAdd
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  nnoremap <leader>nsc :NeoSnippetMakeCache<CR>
endif 
if isGitGutterAdd
  nnoremap <F2> :GitGutterToggle<CR>
endif
if isIndentLineAdd
  nnoremap <leader>il :IndentLinesToggle<CR>
endif
if isVimRainbowAdd
  nnoremap <leader>rb :RainbowToggle<CR>
endif
if isSyntasticAdd
  nnoremap <leader>sm :SyntasticToggleMode<CR>
endif

nnoremap <F1> :!ctags --sort=foldcase -R .<CR>
nmap <F7> :%s///gn<CR>
map nh <ESC>:nohl<CR>
nnoremap <silent> <C-Left> :bprevious<CR>
nnoremap <silent> <C-Right> :bnext<CR>
nnoremap <silent> <C-Left><Left> :bfirst<CR>
nnoremap <silent> <C-Right><Right> :blast<CR>
nmap <C-s> :w! <CR>
vmap <C-s> <Esc> :w! <CR>
imap <C-s> <Esc> :w! <CR>
"                                                            }}} end
" -----------------------------------------------------------------+



