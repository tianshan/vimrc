" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on


" set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
"call vundle#begin()
call plug#begin('~/.vim/plugged')
"Plug 'VundleVim/Vundle.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'
" Plug 'Lokaltog/vim-powerline', {'branch': 'develop'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar', {'on': 'Tagbar', 'for': ['c', 'cpp', 'h', 'hpp']}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'derekwyatt/vim-fswitch'
Plug 'vim-scripts/a.vim'
" Plug 'kshenoy/vim-signature'
" Plug 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'dyng/ctrlsf.vim'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'scrooloose/nerdcommenter'
" Plug 'vim-scripts/DrawIt'
" Plug 'SirVer/ultisnips'
" Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': './install.py' }
" Plug 'derekwyatt/vim-protodef'
Plug 'scrooloose/nerdtree'
Plug 'fholgado/minibufexpl.vim'
" Plug 'gcmt/wildfire.vim'
" Plug 'sjl/gundo.vim'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'suan/vim-instant-markdown'
" Plug 'lilydjwg/fcitx.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
" 插件列表结束
" call vundle#end() " Plugin
call plug#end()


" 自适应不同语言的智能缩进
filetype indent on
" filetype plugin indent on

" 开启语法高亮功能
" syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 定义快捷键到行首和行尾
nmap lb 0
nmap le $

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 设置回退键模式
set backspace=indent,eol,start

" 设置行号
set nu

" set colorcolumn=80

"根据文件类型自动插入文件头
" autocmd BufNewFile *.py,*.sh exec ":call SetTitle()"
" func SetTitle()
"   if &filetype == 'sh'
"     call setline(1, "\#!/bin/bash")
"     call append(line("."), "\# author: qutianshan@gmail.com")
"     call append(line(".")+2, "")
"   elseif &filetype == 'python'
"     call setline(1, "\#!/bin/env python")
"     call append(line("."), "\# -*- coding:utf-8 -*-")
"     call append(line(".")+1, "\# author: qutianshan@gmail.com")
"     call append(line(".")+2, "")
"   endif
"   normal G
"   normal o
" endfunc 

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -std=c++11"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

" 文件改动自动载入
set autoread

" 保证vim在reopen一个文件时定位到同一行
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END


" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T


" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set nonumber
" 设置80列限制
" set colorcolumn=80

" 禁止折行
set nowrap

" 设置状态栏主题风格
" let g:Powerline_colorscheme='solarized256'

let g:solarized_termcolors=256
set background=dark
" set background=light
colorscheme solarized
" colorscheme molokai
" colorscheme phd

" airline config
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

" 高亮显示当前行/列
set cursorline
hi CursorLine cterm=NONE ctermbg=115 ctermfg=white
" set cursorcolumn
" hi CursorColumn cterm=NONE ctermbg=115 ctermfg=white
" 高亮显示搜索结果
set hlsearch


" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=8
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2

" 快捷键 i 开/关缩进可视化
" indent line config
nmap <Leader>i :IndentLinesToggle<CR>
let g:indentLine_color_term = 239
let g:indentLine_char = '.'
let g:indentLine_enabled = 0

" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable


" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" " 子窗口中显示 *.cpp 或 *.h
nmap <Leader>sch :AV<CR>
" *.cpp 和 *.h 间切换
" nmap <silent> <Leader>sw :FSHere<cr>


" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" dont re-generate tags when the project is opened for the first time in the particular Vim session
let g:indexer_dontUpdateTagsIfFileExists=1

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=0
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list 
" nmap <Leader>tl :TagbarToggle<CR> 
nmap <F8> :TagbarToggle<CR>
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码元素生成标签
" let g:tagbar_type_cpp = {
"     \ 'kinds' : [
"          \ 'c:classes:0:1',
"          \ 'd:macros:0:1',
"          \ 'e:enumerators:0:0', 
"          \ 'f:functions:0:1',
"          \ 'g:enumeration:0:1',
"          \ 'm:members:0:1',
"          \ 'n:namespaces:0:1',
"          \ 's:structs:0:1',
"          \ 't:typedefs:0:1',
"          \ 'u:unions:0:1',
"          \ 'v:global:0:1',
"          \ 'x:external:0:1'
"      \ ],
"      \ 'sro'        : '::',
"      \ 'kind2scope' : {
"          \ 'g' : 'enum',
"          \ 'n' : 'namespace',
"          \ 'c' : 'class',
"          \ 's' : 'struct',
"          \ 'u' : 'union'
"      \ },
"      \ 'scope2kind' : {
"          \ 'enum'      : 'g',
"          \ 'namespace' : 'n',
"          \ 'class'     : 'c',
"          \ 'struct'    : 's',
"          \ 'union'     : 'u'
"      \ }
" \ }

" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=~/.vim/stdcpp.tags
"set tags+=/Users/tianshan/.vim/boost.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=0
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>


" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
" nmap <Leader>fl :NERDTreeToggle<CR>
nmap <F9> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=0
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 自动关闭，当只有NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" will not show minibuff, take over by airline
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<CR>
" buffer 切换快捷键
" map <Alt-Tab> :MBEbn<CR>
" map <S-Tab> :MBEbb<CR>
" map <Alt-S-Tab> :MBEbp<CR>
let g:miniBufExplorerAutoStart = 0
" let NBE start as soon as a normal buffer is available
let g:miniBufExplBuffersNeeded = 0

" Fugitive配置
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove
nnoremap <Leader>gp :Ggrep
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git
nnoremap <Leader>gd :Gdiff<CR>

"在屏幕中各子窗口之间切换
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

set ofu=syntaxcomplete#Complete

" 设置显示git修改


" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader>pa %

" 设置自动折行
set wrap

" vim-gitgutter 切换修改位置
nmap <Leader>g <Plug>GitGutterNextHunk
nmap <Leader>G <Plug>GitGutterPrevHunk

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" 高亮多余的空格
highlight ExtraWhitespace ctermbg=red guibg=red
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\+\|\t\+\zs \+/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" set grepprg=ack\ -k
