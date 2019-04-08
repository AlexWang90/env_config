" ---------------------------------------Vundle---------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'                "缩进
Plugin 'vim-airline/vim-airline'            "状态栏
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'            "句法检查
Plugin 'majutsushi/tagbar'                  "tag信息 F7
Plugin 'tmhedberg/SimpylFold'              "python代码折叠   za
Plugin 'SirVer/ultisnips'                   "snippets重复代码 <c-p>
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'             "自动代码补全
Plugin 'scrooloose/nerdcommenter'           "注释    \cc \cu \c<space>
Plugin 'scrooloose/nerdtree'                "文件导航 <c-n>
Plugin 'tell-k/vim-autopep8'                "pep8    F8

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ------------------------------------------------------------------------------------
" common config
set hlsearch            "高亮度反白
set backspace=2         "可随时用退格键删除
set ruler               "可显示最后一行的状态
set showmode            "左下角那一行的状态
set nu                  "以在每一行的最前面显示行号
set bg=dark             "显示的底色色调
syntax on               "进行语法检验，颜色显示
set tabstop=4           "tab=4空格
"set autoindent          "自动缩进
set cursorline          "突出显示当前行"
set noeb                "静音
set vb t_vb=

:set encoding=utf-8
:set fileencodings=ucs-bom,utf-8,cp936
:set fileencoding=utf-8
:set termencoding=utf-8


" ------------------------------------shortcut------------------------------------------
"tagbar 开关
nmap <F7> :TagbarToggle<CR>

":set paste 和:set nopaste 之间切换
set pastetoggle=<F4>

""""""""""""""""""""""
"Quickly Run
""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                    exec "!g++ % -o %<"
                    exec "!time ./%<"
        elseif &filetype == 'cpp'
                    exec "!g++ % -o %<"
                    exec "!time ./%<"
        elseif &filetype == 'java'
                    exec "!javac %"
                    exec "!time java %<"
        elseif &filetype == 'sh'
                    :!time bash %
        elseif &filetype == 'python'
                    exec "!time python2.7 %"
        elseif &filetype == 'html'
                    exec "!firefox % &"
        elseif &filetype == 'go'
                    " exec "!go build %<"
                    exec "!time go run %"
        elseif &filetype == 'mkd'
                    exec "!~/.vim/markdown.pl % > %.html &"
                    exec "!firefox %.html &"
        endif
    endfunc

map <C-n> :NERDTreeToggle<CR>                       "打开/关闭文件导航
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>          "pep8

" --------------------------------------Buffer----------------------------------------
"按Ctrl+h 向左移动一个buffer
nnoremap <C-h> :bp<CR>
"按Ctrl+l 向右移动一个buffer
nnoremap <C-l> :bn<CR>
"按Ctrl+^ 关闭当前buffer
nnoremap <C-^> :bd<CR>

" --------------------------------------状态栏----------------------------------------
set laststatus=2                            "永远显示状态栏
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer
"let g:airline_powerline_fonts = 1           " 支持 powerline 字体
"let g:AirlineTheme='murmur'

" ------------------------------------tagbar------------------------------------------
 let g:tagbar_autofocus = 1      "tagbar一打开，光标即在tagbar页面内
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'   "tagbar

" ------------------------------------句法检查------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0  "总是打开Location List（相当于QuickFix）窗口
"自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0              "如果等于1表示打开文件时自动进行检查
let g:syntastic_check_on_wq = 0                "如果等于1表示进行实时检查

" ------------------------------------语法补充------------------------------------------
let g:UltiSnipsExpandTrigger="<c-p>"                 "snippets
"let g:UltiSnipsJumpForwardTrigger="<c-f>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" ------------------------------------Python缩进/pep8----------------------------------
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_bgcolor_term = 0
let g:indentLine_conceallevel = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] "only works for utf-8 files

et g:autopep8_disable_show_diff=1                    "autopep8设置
set foldlevelstart=99                                "打开文件时不自动折叠

