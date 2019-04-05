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
set tabstop=4          "tab=4空格
"set autoindent          "自动缩进
set cursorline          "突出显示当前行"
set noeb               "静音
set vb t_vb=

:set encoding=utf-8
:set fileencodings=ucs-bom,utf-8,cp936
:set fileencoding=utf-8
:set termencoding=utf-8


" ------------------------------------shortcut------------------------------------------
set pastetoggle=<F4>   ":set paste 和:set nopaste 之间切换

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

" --------------------------------------状态栏----------------------------------------
set laststatus=2                            "永远显示状态栏
let g:airline_powerline_fonts = 1           " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer
let g:AirlineTheme='murmur'

" ------------------------------------Python缩进------------------------------------------
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_bgcolor_term = 0
let g:indentLine_conceallevel = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] "only works for utf-8 files
