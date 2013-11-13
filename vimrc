"""""""""""""""""""""""""""""""""""""""""
""Vundle
""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
let g:vundle_default_git_proto = 'git'
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'a.vim'
"Bundle 'lookupfile'
Bundle 'bufexplorer.zip'
Bundle "surround.vim"
Bundle 'matchit.zip'
Bundle 'genutils'
"Bundle 'mru.vim'
Bundle 'javacomplete'
Bundle 'pythoncomplete'
Bundle 'digitaltoad/vim-jade'
Bundle 'derekwyatt/vim-scala'
Bundle 'UltiSnips'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ccvext.vim'
Bundle 'jsbeautify'
Bundle 'xml.vim'
Bundle 'css_color.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'chilicuil/conque'
Bundle 'FencView.vim'
Bundle 'majutsushi/tagbar'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "djangojump"
Bundle "python.vim"
Bundle "sontek/rope-vim"
Bundle 'rstacruz/sparkup'
"Bundle 'xsunsmile/showmarks'
Bundle "DoxygenToolkit.vim"
Bundle 'scrooloose/nerdtree'
Bundle 'Syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'YankRing.vim'
Bundle 'sjl/splice.vim'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'

Bundle 'Valloric/YouCompleteMe'

"Vundle setting end
filetype plugin indent on

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

func! ShowMarks()
    " Enable ShowMarks
    let showmarks_enable = 0
    " Show which marks
    let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    " Ignore help, quickfix, non-modifiable buffers
    let showmarks_ignore_type = "hqm"
    " Hilight lower & upper marks
    let showmarks_hlline_lower = 1
    let showmarks_hlline_upper = 1
endfunc
"call ShowMarks()

func! Doxygen()
    let g:DoxygenToolkit_authorName="Fangyuanziti"
    let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
    let g:DoxygenToolkit_paramTag_pre="@Param "
    let g:DoxygenToolkit_returnTag="@Returns   "
    let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
    let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
endfunc
call Doxygen()

"Yankring setting

func! CopyConfig()
    let g:yankring_replace_n_pkey = '<leader>['
    let g:yankring_history_dir = '~/.vim/tmp'
    " Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
    vnoremap <leader>yo "*y
    " Paste content from OS's clipboard
    nnoremap <leader>po "*p
endfunc
call CopyConfig()

func! Powerline()
    let g:Powerline_symbols = 'fancy'
    let g:Powerline_cache_enabled = 1
endfunc
call Powerline()
func! Synastic()
    let g:syntastic_check_on_open=0
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_mode_map = { 'mode': 'passive' }
endfunc
"command

func! Comment()
    nmap <leader>, :call NERDComment(0, "invert")<cr>
    vmap <leader>, :call NERDComment(0, "invert")<cr>
endfunc
call Comment()

function Grep()
    nmap <leader>g :Ggrep
    " ,f for global git serach for word under the cursor (with highlight)
    "nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
    " same in visual mode
    "vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>
    autocmd FileType gitcommit set tw=68 spell
endfunc
call Grep()


func! MiscMapping()
    " Fast saving
    nmap <leader>w :w!<cr>
    nmap <leader>wq :w!<cr>:Bclose<cr>
    " Fast editing of the .vimrc
    map <leader>e :e! ~/.vimrc<cr>
    map <leader>r :source ~/.vimrc<cr>
    " When vimrc is edited, reload it
    "autocmd! bufwritepost vimrc source ~/.vimrc

    "directi ; to :
    nmap ; :
    " Begining & End of line in Normal mode
    noremap H ^
    noremap L g_
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Cmd mode misc mappings
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Emacs bindings in command line mode
    cnoremap <c-a> <home>
    cnoremap <c-e> <end>
    " w!! to write a file as sudo
    " stolen from Steve Losh
    cmap w!! w !sudo tee % >/dev/null
endfunc
call MiscMapping()

""""""""""""""""""""""""""""""
" => coding setting
""""""""""""""""""""""""""""""
" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Remove trailing whitespaces when saving
" Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * :%s/\s\+$//e
""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always show the statusline
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Funciton key mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F1> :TagbarToggle<cr>
nmap <F2> :NERDTreeToggle<cr>
nmap <F3> :BufExplorerHorizontalSplit<cr>
nmap <silent> <F4> :SyntasticCheck<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

set guitablabel=%t

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
"map <leader>sn ]s
"map <leader>sp [s
"map <leader>sa zg
"map <leader>s? z=




""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
func! LookUpFile()
    let MRU_Max_Entries = 400
    nmap <F6> :MRU<CR>

    """"""""""""""""""""""""""""""
    " lookupfile setting
    """"""""""""""""""""""""""""""
    let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
    let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
    let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
    let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
    let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
    "映射LookupFile为,lk
    nmap <silent> <leader>lk :LUTags<cr>
    "映射LUBufs为,ll
    nmap <silent> <leader>ll :LUBufs<cr>
    "映射LUWalk为,lw
    nmap <silent> <leader>lw :LUWalk<cr>
    " lookup file with ignore case
    function! LookupFile_IgnoreCaseFunc(pattern)
        function! Tes()
        endfunction
        let _tags = &tags
        try
            let &tags = eval(g:LookupFile_TagExpr)
            let newpattern = '\c' . a:pattern
            let tags = taglist(newpattern)
        catch
            echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
            return ""
        finally
            let &tags = _tags
        endtry

        " Show the matches for what is typed so far.
        let files = map(tags, 'v:val["filename"]')
        return files
    endfunction
    let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'
endfunc

call LookUpFile()

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
"map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste!<cr>

map <leader>bb :cd ..<cr>>

func! NeoComplete()
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " AutoComplPop like behavior.
    let g:neocomplcache_enable_auto_select = 0

    " When you input 'ho-a',neocomplcache will select candidate 'a'.
    let g:neocomplcache_enable_quick_match = 1


    "Neocomplcache menu setting
    let g:neocomplcache_max_list = 5

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions',
                \ 'css' : $VIMFILES.'/dict/css.dic',
                \ 'php' : $VIMFILES.'/dict/php.dic',
                \ 'javascript' : $VIMFILES.'/dict/javascript.dic'
                \ }

    let g:neocomplcache_snippets_dir=$VIMFILES."/snippets"
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><C-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-z>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    inoremap <expr><space>  pumvisible()?neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"

    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

    " Recommended key-mappings.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    "let g:neocomplcache_omni_patterns.python = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
    "let g:neocomplcache_omni_patterns.python = '[^. *\t]\.\h\w*\|\h\w*::'
    "let g:neocomplcache_omni_patterns.python3 = '[^. *\t]\.\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
endfunc

func! OmniComplete()
    set completeopt=longest,menu
    inoremap <C-L> <C-N>
    inoremap <C-H> <C-P>
    inoremap <expr> <C-J>      pumvisible()?"\<C-N>":"\<C-X><C-O>"
    inoremap <expr> <C-K>      pumvisible()?"\<C-P>":"\<C-P>"
    inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"
    inoremap <C-L>             <C-X><C-L>
    inoremap <C-D>             <C-X><C-D>
    inoremap <C-F>             <C-X><C-F>
    inoremap <C-H>             <C-X><C-I>
    inoremap <C-]>             <C-X><C-]>
endfunc


function! Complete()
    let g:UltiSnipsExpandTrigger="<M-l>"
    let g:UltiSnipsJumpForwardTrigger="<M-l>"
    let g:UltiSnipsJumpBackwardTrigger="<M-h>"
    call OmniComplete()
    call NeoComplete()
endfunction

call Complete()

"Genera
function! General()
    set nocompatible " be iMproved
    " Sets how many lines of history VIM has to remember
    set history=700
    " Set to auto read when a file is changed from the outside
    set autoread
    "sessionoptions setting
    set sessionoptions+=globals
    set viminfo +=!
    set viminfo +=%
    " Set 7 lines to the curors - when moving vertical..
    set so=7
    set wildmenu "Turn on WiLd menu
    set ruler "Always show current position
    set cmdheight=2 "The commandbar height
    set hid "Change buffer - without saving
    " Set backspace config
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l
    set ignorecase "Ignore case when searching
    set smartcase
    set hlsearch "Highlight search things
    set incsearch "Make search act like search in modern browsers
    set nolazyredraw "Don't redraw while executing macros
    set magic "Set magic on, for regular expressions
    set showmatch "Show matching bracets when text indicator is over them
    set mat=2 "How many tenths of a second to blink
    " No sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500
    syntax enable "Enable syntax hl
    set gfn=Ubuntu\ Mono\ 13
    set shell=/bin/bash

    colorscheme solarized
    if has("gui_running")
        set guioptions-=T
        "set guioptions-=m
        set guioptions-=e
        set guioptions-=r
        set guioptions-=R
        set guioptions-=l
        set guioptions-=L
        set guioptions-=b
        set background=dark
    else
        set t_Co=256
        set background=dark
    endif
    set nonu
    set encoding=utf-8
    try
        lang en_US
    catch
    endtry

    set ffs=unix,dos,mac
    set fencs=utf-8,gkb,ucs-bom,gb18030,gb2312,cp936
    set nobackup
    set nowb
    set noswapfile

    set undodir=~/.vim/tmp/undodir
    set undofile
    set expandtab
    set shiftwidth=4
    set tabstop=4
    set smarttab

    set lbr
    set tw=500

    set ai "Auto indent
    set si "Smart indet
    set wrap "Wrap lines
endfunction

call General()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fold setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! Fold()
    set foldlevelstart=3
    set foldenable
    set foldmethod=manual
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
    set foldopen-=search
    set foldopen-=undo
endfunc
call Fold()
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

func! VisualConfig()
    vnoremap <silent> * :call VisualSearch('f')<CR>
    vnoremap <silent> # :call VisualSearch('b')<CR>

    " When you press gv you vimgrep after the selected text
    vnoremap <silent> gv :call VisualSearch('gv')<CR>
    " Reselect visual block after indent/outdent
    vnoremap < <gv
    vnoremap > >gv

    nmap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

    function! CmdLine(str)
        exe "menu Foo.Bar :" . a:str
        emenu Foo.Bar
        unmenu Foo
    endfunction

    " From an idea by Michael Naumann
    function! VisualSearch(direction) range
        let l:saved_reg = @"
        execute "normal! vgvy"

        let l:pattern = escape(@", '\\/.*$^~[]')
        let l:pattern = substitute(l:pattern, "\n$", "", "")

        if a:direction == 'b'
            execute "normal ?" . l:pattern . "^M"
        elseif a:direction == 'gv'
            call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
        elseif a:direction == 'f'
            execute "normal /" . l:pattern . "^M"
        endif

        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction
endfunc

call VisualConfig()

func! CommandConfig()
    cnoremap <C-A>      <Home>
    cnoremap <C-E>      <End>
    cnoremap <C-W>      <C-U>

    cnoremap <C-J> <Up>
    cnoremap <C-k> <Down>
endfunc
call CommandConfig()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save when losing focus
func! MoveConfig()
    au FocusLost    * :silent! wall
    map <silent> <leader><cr> :noh<cr>

    "Close the current buffer
    map <leader>bd :Bclose<cr>

    " Close all the buffers
    map <leader>ba :1,300 bd!<cr>

    " Use the arrows to something usefull
    map <C-right> :bn<cr>
    map <C-left> :bp<cr>
    map <C-up> <C-B>
    map <C-down> <C-F><cr>

    " Tab configuration
    map <leader>tn :tabnew<cr>
    map <leader>te :tabedit
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove

    " When pressing <leader>cd switch to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>

    " Specify the behavior when switching between buffers
    set switchbuf=usetab
    set stal=2

    " Smart way to move btw. windows
    nmap <C-k> <C-W>k
    nmap <C-h> <C-W>h
    nmap <C-l> <C-W>l
    nmap <C-j> <C-W>j
    " Splits ,v and ,h to open new splits (vertical and horizontal)
    nnoremap <leader>v <C-w>v<C-w>l
    nnoremap <leader>s <C-w>s<C-w>j

    " Move up and down more comfortable
    nmap j gj
    nmap k gk
endfunc
call MoveConfig()


"Python Mode
au FileType python call PythonMode()

function! PythonMode()
    let python_highlight_all = 1
    syn keyword pythonDecorator True None False self
    "autocmd FileType python runtime! autoload/pythoncomplete.vim
    au BufNewFile,BufRead *.jinja set syntax=htmljinja
    au BufNewFile,BufRead *.mako set ft=mako

    inoremap <buffer> $r return
    inoremap <buffer> $i import
    inoremap <buffer> $p print
    inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
    map <buffer> <leader>1 /class
    map <buffer> <leader>2 /def
    map <buffer> <leader>C ?class
    map <buffer> <leader>D ?def

    let g:ropevim_vim_completion=1
    let g:ropevim_extended_complete=1
endfunction

"JavaScript Mode
au FileType javascript call JavaScriptMode()

function! JavaScriptMode()
    setl fen
    setl nocindent

    imap <c-t> AJS.log();<esc>hi
    imap <c-a> alert();<esc>hi
    inoremap <buffer> $r return
    inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi
    call JavaScriptFold()
endfunction

function! JavaScriptFold()
    set expandtab
    set shiftwidth=2
    set tabstop=2
    set smarttab

    "setl foldmethod=indent
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

"JavaMode
au FileType java call JavaMode()
function! JavaMode()
    set path+=~/project/android-sdk-linux/sources/android-15
    call JavaImp()
endfunction

function! JavaImp()
    let g:JavaImpPaths = $HOME."/project/android-sdk-linux/sources/android-15/,".
                \ $HOME.'~/project/BookReader/src/'
    let g:JavaImpDataDir = $HOME."/.vim/JavaImp"
    let g:JavaImpSortPkgSep = 0
    map <leader>t :JavaImp<cr>
endfunction

"C,Cpp Mode
autocmd FileType c,cpp call CppMode()

function! CppMode()
    let g:syntastic_cpp_compiler_options = ' -std=c++0x'
    let g:syntastic_cpp_config_file = '.clang_complete'
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_check_header = 1
    let g:syntastic_cpp_auto_refresh_includes = 1
    call Cscope()
endfunc

function! Cscope()
    if has("cscope")
        set csprg=/usr/bin/cscope
        set csto=1
        set cst
        set nocsverb
        set csverb
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    nmap <M-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <M-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <M-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <M-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <M-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <M-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <M-i> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <M-d> :cs find d <C-R>=expand("<cword>")<CR><CR>
endfunction

"coffee mode
au FileType coffee call CoffeeMode()

func! CoffeeMode()
    set expandtab
    set shiftwidth=2
    set tabstop=2
    set smarttab
endfunction

"Jade mode
au FileType jade call JadeMode()

func! JadeMode()
    set expandtab
    set shiftwidth=2
    set tabstop=2
    set smarttab
endfunction
