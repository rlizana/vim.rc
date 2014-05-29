" no vi-compatible
set nocompatible

" set syntax highlight on
syntax on

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" required for vundle
filetype on

filetype plugin on
filetype indent on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Bundle 'fisadev/vim-ctrlp-cmdpalette'
" Git integration
Bundle 'motemen/git-vim'
" Tab list panel
Bundle 'kien/tabman.vim'
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'
" Surround
Bundle 'tpope/vim-surround'
" Autoclose
Bundle 'Townk/vim-autoclose'
" Indent text object
Bundle 'michaeljsmith/vim-indent-object'
" Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
" Git diff icons on the side of the file lines
Bundle 'airblade/vim-gitgutter'
" Status/tabline for vim light as air
Bundle 'bling/vim-airline'
" Awesome Python autocompletion with VIM
Bundle 'davidhalter/jedi-vim'
" Python folding"
"Bundle 'tmhedberg/SimpylFold' (likely slow down speed)


" Bundles from vim-scripts repos

" Autocompletion
Bundle 'AutoComplPop'
" Python code checker
Bundle 'pyflakes.vim'
" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
Bundle 'Wombat'
" Yank history navigation
Bundle 'YankRing.vim'
" C/C++ cmode plugins
Bundle 'c.vim'
" Cscope plugin for skip operation
Bundle 'cscope.vim'
" Simplify Doxygen documentaion in C,C++,Python
Bundle 'DoxygenToolkit.vim'

"Install "Markdown-vim" by doing(manually).


" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" allow plugins by file type
filetype plugin on
filetype indent on

" tabs and spaces handling
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" always show status bar
set ls=2

" incremental search
set incsearch

" highlighted search results
set hlsearch

" line numbers
set nu

" toggle Tagbar display
map <F4> :TagbarToggle<CR>

" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" NERDTree (better file browser) toggle
map <F3> :NERDTreeToggle<CR>

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j


" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" show pending tasks list
map <F2> :TaskList<CR>

" save as sudo
ca w!! w !sudo tee "%"

" airline settings
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_powerline_fonts = 1

" colors and settings of autocompletion
highlight Pmenu ctermbg=4 guibg=LightGray
" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black

" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 0
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 0
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add
" namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]


" CtrlP (new fuzzy finder)
" ,e = open file (like the original :e) but with recursive and fuzzy file name
" matching. Example: if you type "mopy" it will find a file named "models.py" placed on a subdirectory. And allows you to open the selected file on a new tab with Ctrl-t! " "
" ,g = fuzzy symbol finder (classes, methods, variables, functions, ...) on
" the current file. Example: if you type "usr" it will find the User class
" definition on the current file. ,G does the same but on all opened files. "
" ,G does the same but on all opened files.
" ,f = fuzzy text finder on all the opened files. Example: if you type "ctm=6" it will find the line containing "current_time = 16"." "
" ,m = fuzzy finder of most recently used files.
" ,c = fuzzy command finder (internal vim commands, or custom commands).
" Example: if you type "diff" it will find :GitDiff, :diffthis, and many other similar commands. "

let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" Don't change working directory
let g:ctrlp_working_path_mode = 0
" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Jedi-vim python autocompletion
"Usages <leader>n (shows all the usages of a name)
"Open module, e.g. :Pyimport os (opens the os module)
let g:jedi#goto_assignments_command = ",d"
let g:jedi#goto_definitions_command = ",j"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ",u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"

" DoxygenToolkit settings
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="=========================================================================="
let g:DoxygenToolkit_blockFooter="=========================================================================="
let g:DoxygenToolkit_authorName="MY NAME"
let g:DoxygenToolkit_licenseTag="MY OWN LICENSE" 
"let g:DoxygenToolkit_commentType = "Python"
" :DoxLic (license comment)
" :DoxAuthor (author comment)
" :Dox    (place the cursor on the line of the function header or the class to)
" :DoxBlock (Insert a doxygen block)

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
" ,R uses vimgrep (slower)
nmap ,R :RecurGrep 
" ,r uses the system grep (faster).
nmap ,r :RecurGrepFast 
" ,wr and ,wR do the same, but searching the word under the cursor.
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>

" tabman shortcuts
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
    " color
    colorscheme fisa
else
    " color
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

" change the default theme
let g:airline_theme= 'ubaryd'

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Previewing of your folded classes' and functions' docstrings in the fold text,
"let g:SimpylFold_docstring_preview = 1
" You don't want to see your docstrings folded
"let g:SimpylFold_fold_docstring = 0

" set line underlying current cursor (Sometimes it will cause mosaic.
" That means you cannot see the current line clearly.)
set cursorline

" incording to what your typing case to decide chose ignore case or not
set ignorecase

" 命令
" In normal mode:
" <C-E> move screen up.
" <C-Y> move screen down.
" <C-D> move down half of screen
" <C-U> move up half of screen
" Comment and Uncomment Code with  \cc \cc \cc and \ci \ci \ci \ci
" <C-I> <C-O>在上一个鼠标位置与下一个鼠标位置之间跳转，也可以用于文件跳转.
" zi    toggle folding


" In Visual mode:
" replacement:
" 1.choose where you want to replace block and press ':'
" 2.then status bar will show :'<,'>
" 3.continuing input " s/{old pattern}/{new pattern}/g "
" eg: s/abc/ABC/g should cause abc -> ABC

"vi: Search and Replace
"Change to normal mode with <ESC>.
"Search (Wrapped around at end of file):
  "Search STRING forward :   / STRING.
  "Search STRING backward:   ? STRING.
  "Repeat search:   n
  "Repeat search in opposite direction:  N  (SHIFT-n)
"replace: Same as with sed, Replace OLD with NEW:
 "First occurrence on current line:      :s/OLD/NEW
 "Globally (all) on current line:        :s/OLD/NEW/g 
 "Between two lines #,#:                 :#,#s/OLD/NEW/g
" Every occurrence in file:              :%s/OLD/NEW/g 


" 当从其他窗口Cmd+C 粘贴到Vim中时，需要set paste。
" 不需要粘贴时使用 set nopaste,否则会影响粘贴.
map <F5> :setlocal paste!<cr>

imap <c-b> <Left>
imap <c-f> <Right>
imap <c-e> <End>
imap <c-a> <Home>
imap <c-d> <Del>
imap <c-k> <ESC>ld$a

"============================================================
"========================c/c++ settings======================
"============================================================

" CSCOPE
" in case your cscope execute is not in system path.
" let g:cscope_cmd = 'D:/tools/vim/cscope.exe'
" s: Find this C symbol
map <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
map <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>

" d: Find functions called by this function
map <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
map <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>

" t: Find this text string
map <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
map <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
map <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
map <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
map <leader>l  :call ToggleLocationList()<CR>

" Refresh cscope database
" If there is no path_to_the_folder provided, all existing cscope databases
" will be re-created.
":CscopeGen [path_to_the_folder]

":CscopeClear    to remove all existing cscope databases
":CscopeList     to list all existing cscope databases
"
" Goto to File on current cursor: gf
