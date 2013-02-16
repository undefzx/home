set t_Co=256

colorscheme molokai
"colorscheme far_true
set tags=./tags;/
set encoding=utf-8
set fencs=utf8,cp1251 " порядок перебора кодировок при открытии файла
set ignorecase " игнорирование регистра
set smartcase " отрубаем ignorecase если есть прописные букв
set noswapfile " не используем swap файлы, чтобы не засорять память
set hls " подсвечивать слово при поиске
map <C-N> :set<Space>nu!<CR>
map <C-H> :set<Space>hls!<CR>
map <Leader>w :set<Space>wrap!<CR>


" normal autocomplete
set wildmenu
set wildmode=list:longest
set cot=menu,longest


" Vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/taglist.vim'
Bundle 'slack/vim-bufexplorer'
Bundle 'c9s/perlomni.vim'
Bundle 'msanders/snipmate.vim'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

Bundle 'shemerey/vim-project'
Bundle 'vimprj'
Bundle 'DfrankUtil'
"Bundle 'indexer.tar.gz'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'tomasr/molokai'
Bundle 'perl-support.vim'
Bundle 'matchit.zip'
Bundle 'indentpython.vim'
Bundle 'pythoncomplete'
Bundle 'mattn/zencoding-vim'
""Bundle 'kevinw/pyflakes-vim'
Bundle 'pyflakes.vim'
Bundle 'pep8'
Bundle 'vim-scripts/python.vim--Vasiliev'
""Bundle 'pylint.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'pythonhelper'
"Bundle 'vim-scripts/AutoFold.vim'
Bundle 'pangloss/vim-simplefold'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/Jinja'

filetype plugin indent on     " required! 
" /Vundle

let g:pep8_map='<leader>8'
let g:indexer_disableCtagsWarning=1 " indexer
let g:acp_behaviorPerlOmniLength=1 " AutoComplPop

" jiangmiao/auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsMapBS = 0

nmap <silent> <F5> <Plug>ToggleProject
imap <silent> <F5> <Esc><Plug>ToggleProject

set list          " отображать табы (работает вместе с listchars)
set listchars=tab:\|\ \,trail:> " отображать табы и пробелы

" remeber cursor position in edited file
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set nowrap
" перенос по словам, а не по буквам
"set linebreak
"set dy=lastline

" проверка ошибок
" setlocal spell spelllang=ru_ru,en_us
" привести концы строк в файле к виду dos или unix соответственно:
set fileformat=unix

" поддержка русской раскладки в нормальном режиме
"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\;'zxcvbnm\,.,ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>

" еще один вариант поддержки раскладки
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Far like selection
nmap <S-Ins> gP
nmap <S-End> v<End><Left>
nmap <S-Home> v<Home>
vmap <S-Del> <Del>
nmap <S-Down> v<Down><Left>
vmap <S-Down> <Down>
nmap <S-Up> <Up>V
vmap <S-Up> <Up>

" перевесим tjump на <C-]>
map <C-]> :exec("tjump ".expand("<cword>"))<CR>

"nmap <CR> i<CR><ESC>

" сохранение файла
imap <F2> <ESC>:w<CR>
vmap <F2> :w<CR>
nmap <F2> :w<CR>

imap <F10> <ESC>:q<CR>a
vmap <F10> :q<CR>
nmap <F10> :q<CR>

map <F12> <Esc>:BufExplorer<CR>

"set backspace=indent,eol,start
set backspace=indent,eol,start whichwrap+=<,>,[,] " use backspace instead of "x"
"nmap <Backspace> hx
" Backspace - удаляет в нормальном режиме

" список директорий
"let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
map <F3> <Esc>:NERDTreeToggle<CR>


" tag list
map <F4> :TlistToggle<CR>
"map <S-F4> :TlistToggle<CR>

map <F6> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

"map <F12> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

function! InsertTabWrapper(direction)
    let col = col('.') - 1
	let line = getline('.')
	if (!col || line[col - 1] !~ '\k') && line[col - 1] !~ '[>\.]'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
"       return "\<c-x>\<c-o>"
    else
"       return "\<c-x>\<c-o>"
        return "\<c-n>"
    endif
endfunction

inoremap <C-Space> <c-r>=InsertTabWrapper ("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" tabs
set autoindent      " включить автоотступы
set copyindent      " при авто-отступах копировать текущую структуру отступов
set softtabstop =4  " сколько провелов в табе (при нажатии Tab или Backspace)
set tabstop     =4  " ширина таба 4 пробела
set shiftwidth  =4  " кол-во пробелов при отступах в 'cindent', >>, <<, и т.д.
set textwidth   =0 " ширина текстовой строки
" заменять таб пробелами
"set expandtab

let Tlist_Inc_Winwidth       = 0 " TagList: Не расширять окошко
let Tlist_Use_Right_Window   = 1 " Открываться в окошке справа
let Tlist_Exit_OnlyWindow    = 1 " Завершаться, если Tlist посл. окно
let Tlist_Show_One_File      = 1 " Показывать тэги только для текущего файла
let Tlist_Enable_Fold_Column = 0 " no fold column (only showing one file)
let Tlist_Use_SingleClick    = 1 " переходить на тэг в один клик
let Tlist_Compact_Format     = 1 " Не показывать лишней информации
let g:Tlist_Sort_Type        = "name"

"if !exists("autocommands_loaded")
"    let autocommands_loaded = 1
"    autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
"endif

set wildmenu
"set wcm=<Tab>
menu Encoding.koi8-r  :e ++enc=koi8-r<CR>
menu Encoding.cp1251  :e ++enc=cp1251<CR>
menu Encoding.cp866   :e ++enc=cp866<CR>
menu Encoding.ucs-2le :e ++enc=ucs-2le<CR>
menu Encoding.utf-8   :e ++enc=utf-8<CR>
map <S-F8> :emenu Encoding.<Tab>
map <F8> :emenu Encoding.<Tab>

"let g:acp_enableAtStartup = 0

nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

"autocmd FileType python compiler pylint

"set foldenable  
"set foldmethod=syntax
"syn region CodeBlock start=/{/ end=/}/ transparent fold

set complete -=i
set incsearch

" vertical column
if v:version >= 703
	set colorcolumn=81
	highlight ColorColumn ctermbg=lightgrey ctermfg=Black guibg=lightgrey guifg=Black
endif

