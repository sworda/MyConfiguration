" vimrc         {{{1

let g:iswindows=0
let g:islinux=0
" 设置系统变量  {{{2
if(has("win32") || has("win64") || has("win95") || has("win16")) "判定当前操作系统类型
    let g:iswindows=1
else
    let g:islinux=1
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"完全隐藏菜单：
:set guioptions-=m " 可以随时用 :set guioptions+=m 再呼出菜单,下面工具条也类似
"完全隐藏工具栏：
:set guioptions-=T

" 插件管理设置      {{{2
" Pathogen设置      {{{3
" runtime bundle/vim-pathogen/autoload/pathogen.vim
" call pathogen#infect('addons')

" Vundle设置        {{{3
set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
filetype off
if(g:iswindows==1)
    set rtp+=$VIM/vimfiles/bundle/vundle
    call vundle#rc('$VIM/vimfiles/bundle/')
else
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
endif

" 配置lua
Plugin 'xolox/vim-misc'  " required by lua.vim
Plugin 'xolox/vim-lua-ftplugin'  " Lua file type plug-in for the Vim text editor
" 加载插件
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails'
Bundle 'Lokaltog/vim-powerline'
Bundle 'molokai'
Bundle 'a.vim'
Bundle 'AuthorInfo'
Bundle 'auto_mkdir'
Bundle 'ayang/AutoComplPop'
Bundle 'ctrlp.vim'
Bundle 'DoxygenToolkit.vim'
Bundle 'FencView.vim'
Bundle 'othree/html5.vim'
Bundle 'jsbeautify'
Bundle 'teramako/jscomplete-vim'
Bundle 'hallison/vim-markdown'
Bundle 'matchit.zip'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'taglist.vim'
Bundle 'OmniCppComplete'
Bundle 'fs111/pydoc.vim'
Bundle 'slimv.vim'
Bundle 'surround.vim'
Bundle 'TabBar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'VOoM'
Bundle 'VST'
Bundle 'xml.vim'
Bundle 'drmingdrmer/xptemplate'
Bundle 'ZenCoding.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'lua.vim'
Bundle 'myhere/vim-nodejs-complete'
Bundle 'digitaltoad/vim-jade'
Bundle 'tpope/vim-pathogen'
Bundle 'winmanager'
Bundle 'c.vim'
Bundle 'chazy/cscope_maps'
Bundle 'Command-T'
" 系统设置  {{{2
" 打开文件类型检测  {{{3
filetype plugin indent on

" 设置Leader    {{{3
let mapleader = ","

" 设置缩进      {{{3
if has("autocmd")
    augroup vimrcEx
        au!
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
else
    set autoindent " always set autoindenting on 
endif " has("autocmd")

" 使用类Windows操作         {{{3
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" vim在windows下的编码设置。    {{{3
set fileencodings=utf-8,chinese,latin-1 

" Vim字体设置               {{{3
if (g:iswindows==1)
    "解决consle输出乱码 
    language messages zh_CN.gbk
    set guifont=YaHei_Consolas_Hybrid:h10
else 
    set langmenu=zh_CN.UTF-8
    set guifont=文泉驿等宽微米黑\ 10
endif 

" 高亮查找
set hlsearch

" powerline配置 {
 set guifont=PowerlineSymbols\ for\ Powerline
 " Always show the statusline
 set laststatus=2   
 set t_Co=256
 let g:Powerline_symbols = 'fancy'
" powerline配置 }

" 解决菜单乱码      {{{3
source $VIMRUNTIME/delmenu.vim 
source $VIMRUNTIME/menu.vim 

" 设置行号，颜色主题等  {{{3
set nu
set ruler
colorscheme murphy
set ambiwidth=double 

"设置当前行和列选中状态，这个一定要放在设置颜色和主题后面，不然会被主题给冲掉
set cursorcolumn                    
set cursorline                      
                                    
highlight CursorLine cterm=NONE ctermbg=darkgray ctermfg=blue guibg=NONE guifg=NONE                                                                                                                                                                                           
"highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=gray guibg=NONE guifg=NONE

" 允许退格键删除和tab操作  {{{3
set smartindent  
set smarttab
set expandtab  
set tabstop=4  
set softtabstop=4  
set shiftwidth=4  
set backspace=2
"set textwidth=79


" 设置补全Tag       {{{3
if(g:iswindows==1)
    autocmd FileType php setlocal dict+=$VIM\dict\php_funclist.txt
    autocmd FileType js set dictionary+=$VIM.'\dict\javascript.dict'
    autocmd FileType js set dictionary+=$VIM.'\dict\nodejs.dict'
    let g:pydiction_location=$VIM.'\dict\complete-dict'
    "set tags+=$VIM\dict\mingw_tags
    "set tags+=$VIM\dict\qt_tags
    set tags+=$VIM\dict\stl_tags
    "set tags+=$VIM\dict\wx_tags
    let g:ruby_path = ':C:\ruby193\bin'
else
    autocmd FileType php setlocal dict+=~/.vim/dict/php_funclist.txt
    autocmd FileType js set dictionary+='~/.vim/dict/javascript.dict'
    autocmd FileType js set dictionary+='~/.vim/dict/nodejs.dict'
    let g:pydiction_location = '~/.vim/dict/complete-dict'
    "set tags+=~/.vim/dict/mingw_tags
    "set tags+=~/.vim/dict/qt_tags
    set tags+=~/.vim/dict/stl_tags
    "set tags+=~/.vim/dict/wx_tags
endif 

" 设置补全和文件类型      {{{3
let g:OmniCpp_DefaultNamespaces = [ "std" ]
let g:OmniCpp_DisplayMode = 1 " show all class members
let g:OmniCpp_MayCompleteDot = 1 " autocomplete with .
let g:OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let g:OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let g:OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let g:OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let g:OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

autocmd BufNewFile,BufRead *.mkd set filetype=mkd
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
autocmd BufRead,BufNewFile *.js set syntax=jquery
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=nodejscomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"补全Python
let $PYTHONPATH = "."
"补全Ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
"补全Lua
let g:lua_complete_omni = 1
"cscope show in quickfix
set cscopequickfix=s-,c-,d-,i-,t-,e-
let php_sql_query=1                                                                                        
let php_htmlInStrings=1
" 补全js
let g:jscomplete_use = ['dom', 'moz', 'xpcom', 'es6th']
" 补全node.js
let g:node_usejscomplete = 1

" 设置缩进线            {{{3
set list
set listchars=tab:\|\ 

" 设置VimDiff           {{{3
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" 设置PHP debuggerPort      {{{3
let g:debuggerPort = 9001

" 语法检查          {{{2

" php {{{3
function CheckPHPSyntax()
    let php_check_syntax_cmd='ZendCodeAnalyzer  --disable var-arg-unused'
    let exeFile = expand("%:t")
    let &makeprg = php_check_syntax_cmd
    set errorformat=%f(line\ %l):\ %m
    silent make %
    if len(getqflist())>2
        call setqflist(remove(getqflist(),2,-1))
        copen
    else
        cclose
        normal :
        echohl WarningMsg | echo "Check over,No error!" | echohl None
    endif
endf
au filetype php map <C-j> :call CheckPHPSyntax()<CR>
au filetype php imap <C-j> <ESC>:call CheckPHPSyntax()<CR>
"}}}

" Python        {{{3
function CheckPythonSyntax()
    if &filetype != 'python'
        echohl WarningMsg | echo 'This is not a Python file !' | echohl None
        return
    endif
    setlocal makeprg=python\ -u\ %
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    echohl WarningMsg | echo 'Syntax checking output:' | echohl None
    if &modified == 1
        silent write
    endif
    exec "silent make -c \"import py_compile;py_compile.compile(r'".bufname("%")."')\""
    clist
endfunction
au filetype python map <C-j> :call CheckPythonSyntax()<CR>
au filetype python imap <C-j> <ESC>:call CheckPythonSyntax()<CR>

"插件设置   {{{2

" 配置Vundle    {{{3
let $GIT_SSL_NO_VERIFY = 'true'

" Voom快捷键    {{{3
map <F11> :Voom<CR>

" 关闭buffer但不关闭当前窗口    {{{3
function! CleanClose(tosave)
if (a:tosave == 1)
    w!
endif
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b!".newbufNr
else
    bnext
endif
if (bufnr("%") == todelbufNr)
    new
endif
exe "bd!".todelbufNr
endfunction

" 关闭buffer并保存          {{{4
map <leader>s <Esc>:call CleanClose(1)<CR>
" 关闭buffer但不保存        {{{4
map <leader>q <Esc>:call CleanClose(0)<CR>

" mark快捷键        {{{3
nmap <Leader>M <Plug>MarkToggle 
nmap <Leader>N <Plug>MarkAllClear 

" CommandT快捷键    {{{3
map <S-F3> :CommandT<CR>

" TagList设置           {{{3
let Tlist_Ctags_Cmd='ctags'     "因为我们放在环境变量里，所以可以直接执行
let Tlist_Show_One_File=1       "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1     "当taglist是最后一个分割窗口时，自动退出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=0 "不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0

" WinManger设置         {{{3
let g:winManagerWindowLayout='NERDTree|TagList'
nmap <F3> :WMToggle<CR>

let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()
    exe 'NERDTree'
endfunction
function! NERDTree_IsValid()
return 1
endfunction

"NERD Tree
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'/Data/NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
"nnoremap f :NERDTreeToggle


" 自动添加作者信息插件      {{{3
let g:vimrc_author='Lynn Ran' 
let g:vimrc_email='ran.liyue@gmail.com' 
let g:vimrc_homepage='www.lynnran.com' 
nmap <F4> :AuthorInfoDetect<CR>

"
set tags=tags

" 自动生成tag       {{{3
map <F12> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

" 对NERD_commenter的设置        {{{3
let NERDShutUp=1
map <c-h> ,c 

" DoxygenToolkit.vim 由注释生成文档，并且能够快速生成函数标准注释 {{{3
map ,g :Dox<cr>
let g:DoxygenToolkit_authorName="Syndim"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30

" BO2目录配置
" if(g:iswindows==1)
"     let g:bo2_initpath="E:\\trunk"
" endif
