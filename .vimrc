"=========================================================================

" DesCRiption: vimrc configure file, for Linux/Windows, GUI/Console

" Maintainer:
"		Justin Ron
"		http://www.zygotee.com
"		admin@zygotee.com
"		https://github.com/justinron

" Last Change: 2015/03/30

" Version:     1.0

"=========================================================================


set nocompatible            " disable vi compatible mode

"for vundle config start--------------------------------------------------
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'The-NERD-tree'
Plugin 'taglist.vim'
Plugin 'wesleyche/SrcExpl'
Plugin 'genutils'
Plugin 'lookupfile'
Plugin 'bling/vim-airline'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'EasyGrep'
Plugin 'scrooloose/nerdcommenter'
Plugin 'gcmt/wildfire.vim'
Plugin 'SuperTab'
Plugin 'flazz/vim-colorschemes'
Plugin 'justinron/snipmate.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'justinron/auto-pairs'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
"for vundle config end--------------------------------------------------

syntax on                   " highlight the syntax

" set expandtab               " expand tab to space
set noexpandtab

let c_space_errors=1

colorscheme molokai         " color scheme
"colorscheme desert

set number                  " line number show up

set cursorline              " highlight the current line
set cursorcolumn            " highlight the current colum

set ruler

" set shiftwidth=4            " set the width when type << and >>

" set softtabstop=4           " set the width when type backspace

set tabstop=8               " set tab width

set nobackup                " no backup when overwrite

set autochdir

filetype plugin indent on

set backupcopy=yes

set ignorecase smartcase    " ignore the case when searching

set nowrapscan

set incsearch

set hlsearch                " highlight the searched result

set noerrorbells

set novisualbell

set t_vb=

" set showmatch

" set matchtime=2

set magic

set hidden

set guioptions-=T

set guioptions-=m

set smartindent

set backspace=indent,eol,start

set cmdheight=1

set laststatus=2

set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 

                            " set the displayed info on status line

set foldenable

set nofoldenable

set foldmethod=manual

au BufWinLeave * silent mkview    " auto-save the view when close
au BufWinEnter * silent loadview  " auto-load the view when open

" set foldmethod=syntax

set foldcolumn=0            " set the fold width

setlocal foldlevel=1        " set the fold layer limit

" set foldclose=all

" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

                            " toggle fold by space key



" return OS type, eg: windows, or linux, mac, et.st..

function! MySys()

    if has("win16") || has("win32") || has("win64") || has("win95")

        return "windows"

    elseif has("unix")

        return "linux"

    endif

endfunction



" user home directory variable$VIMFILES

if MySys() == "windows"

    let $VIMFILES = $VIM.'/vimfiles'

elseif MySys() == "linux"

    let $VIMFILES = $HOME.'/.vim'

endif



" set doc file directory

let helptags=$VIMFILES.'/doc'



" set font, Chinese support

if has("win32")

    set guifont=Inconsolata:h12:cANSI

endif



" configure multi-language environment

if has("multi_byte")

    " UTF-8 coding

    set encoding=utf-8

    set termencoding=utf-8

    set formatoptions+=mM

    set fencs=utf-8,gbk



    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'

        set ambiwidth=double

    endif



    if has("win32")

        source $VIMRUNTIME/delmenu.vim

        source $VIMRUNTIME/menu.vim

        language messages zh_CN.utf-8

    endif

else

    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"

endif

" when open file, navigate the cursor to the location last time exit
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\	exe "normal! g'\"" | endif

" Set mapleader
let mapleader=","

let g:ycm_global_ycm_extra_conf = '/home/justin/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'   "配置默认的ycm_extra_conf.py
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tag_files = 1 "using tags file generated by ctags
let g:ycm_register_as_syntastic_checker = 0

" Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<CR>
" Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<CR>
" When .vimrc is edited, reload it
autocmd bufwritepost .vimrc source ~/.vimrc

" enable :Man command to see the man info
source $VIMRUNTIME/ftplugin/man.vim
" define :Man hotkey
nmap <Leader>man :Man 3 <cword><CR>

" Buffers hotkeys

nnoremap <C-RETURN> :bnext<CR>

nnoremap <C-S-RETURN> :bprevious<CR>


"-----------------------------------------------------------------
" snipMate Setting
"-----------------------------------------------------------------
" 1.remap the trigger key from <tab> to <C-\> for the confliction with SuperTab
" 2.should comment the trigger key configuration in snipMate/after/plugin/snipMate.vim
ino <silent> <C-\> <c-r>=TriggerSnippet()<cr>
snor <silent> <C-\> <esc>i<right><c-r>=TriggerSnippet()<cr>

" Tab hotkeys

nnoremap <C-TAB> :tabnext<CR>

nnoremap <C-S-TAB> :tabprev<CR>

" map tn :tabnext<cr>

" map tp :tabprevious<cr>

" map td :tabnew .<cr>

" map te :tabedit

" map tc :tabclose<cr>



" window split

nnoremap <C-h> <C-w>h

nnoremap <C-j> <C-w>j

nnoremap <C-k> <C-w>k

nnoremap <C-l> <C-w>l




nnoremap <leader>1 :set filetype=xhtml<CR>

nnoremap <leader>2 :set filetype=css<CR>

nnoremap <leader>3 :set filetype=javascript<CR>

nnoremap <leader>4 :set filetype=php<CR>



" set fileformats=unix,dos,mac

" nmap <leader>fd :se fileformat=dos<CR>

" nmap <leader>fu :se fileformat=unix<CR>



" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result

" map <C-x>l <ESC>:cl<CR>

" map <C-x>n <ESC>:cn<CR>

" map <C-x>p <ESC>:cp<CR>

" map <C-x>c <ESC>:cc<CR>





let html_use_css=1

"-----------------------------------------------------------------
" wildfire.vim setting
"-----------------------------------------------------------------
" This selects the next closest text object.
" map <SPACE> <Plug>(wildfire-fuel)
map <leader><SPACE> <Plug>(wildfire-fuel)
" This selects the previous closest text object.
" vmap <S-SPACE> <Plug>(wildfire-water)
vmap <BS> <Plug>(wildfire-water)
" By default, Wildfire selects any of the text objects i', i", i), i], i}, ip
" and it. You can decide the ones to consider with the following option:
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip", "it"]

" Python file settings, such like no tab and so forth

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab

autocmd FileType python map <F12> :!python %<CR>



" Ctrl+c to copy in Visual Mode 

vmap <C-c> "+y



" enable javascript fold

let b:javascript_fold=1

" enable javascript support to dom/html/css

let javascript_enable_domhtmlcss=1

" set dict ~/.vim/dict/ path

" autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict

" autocmd filetype css set dictionary=$VIMFILES/dict/css.dict

" autocmd filetype php set dictionary=$VIMFILES/dict/php.dict

"-----------------------------------------------------------------
" cscope database path setting
"-----------------------------------------------------------------
	set csprg=/usr/bin/cscope		"cscope location
	set csto=0						"cscope DB search first
	set cst							"cscope DB tag DB search
	set nocsverb					"verbose off

	" cscope DB location, use the absolute path
"	cs add /local/linux-3.4.39/cscope.out
	set csverb						"verbose off

" enable auto load the ctags/cscope recursive upward
function! AutoLoadTagsAndCscope()
	let max = 15
	let dir	= './'
	let i = 0
	let break = 0
	while isdirectory(dir) && i < max
		if filereadable(dir . 'cscope.out')
			execute 'cs add ' . dir . 'cscope.out'
			let break = 1
		endif
		if filereadable(dir . 'tags')
			execute 'set tags =' . dir . 'tags'
			let break = 1
		endif
		if break == 1
			execute 'lcd' . dir
			break
		endif
		let dir = dir . '../'
		let i = i + 1
	endwhile
endf
nmap <F7> :call AutoLoadTagsAndCscope()<CR>
call AutoLoadTagsAndCscope()

" generate the filenametags for specfied directory, make it as the lookup src
function! SetRootOfTheProject(path)
	exe 'cd '.a:path
	exe '!genfiletags'
	let tagFilePath = genutils#CleanupFileName(a:path.'/filenametags')
	exe "let g:LookupFile_TagExpr='\"".tagFilePath."\"'"
endfunction
function! SetHereTheRoot()
	call SetRootOfTheProject('.')
endfunction
nmap <leader>root :call SetHereTheRoot()<CR>
function! SetSpecifiedPathTheRoot()
	call SetRootOfTheProject(input('please input the root dir of project:'))
endfunction
nmap <leader>z :call SetSpecifiedPathTheRoot()<CR>
                                                  
"nmap <leader>o :LookupFile<CR>
"nmap <unique> <silent> <F6> <Plug>LookupFile
nmap <silent> <F6> <Plug>LookupFile

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
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

"""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable("./filenametags")
let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent> <leader>lk :LUTags<cr>
nmap <silent> <leader>ll :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>

"-----------------------------------------------------------------

" plugin - FuzzyFinder

"-----------------------------------------------------------------

map <leader>F :FufFile<CR>
map <leader>f :FufTaggedFile<CR>
map <leader>g :FufTag<CR>
map <leader>b :FufBuffer<CR>

"-----------------------------------------------------------------

" plugin - ctrlp

"-----------------------------------------------------------------
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 0  " no limited file numbers
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 0
let g:ctrlp_open_multiple_files = 'v'
"let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.cmd,*.o,*.zip " MacOSX/Linux

"-----------------------------------------------------------------

" plugin - vim-airline

"-----------------------------------------------------------------
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" buffer number in tabline
let g:airline#extensions#tabline#buffer_nr_show = 1

nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>
" switch to previous buffer
map <leader>, :bp<CR>
" switch to next buffer
map <leader>. :bn<CR>
" close the current buffer
map <leader>d :bdelete<CR>
" switch to previous buffer
map <leader><TAB> :b #<CR>

"-----------------------------------------------------------------

" plugin - taglist.vim

" F4 to enable taglist window

"-----------------------------------------------------------------

if MySys() == "windows"

    let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'

elseif MySys() == "linux"

    let Tlist_Ctags_Cmd = '/usr/bin/ctags'

endif


"-----------------------------------------------------------------
" Tag List env settings
"-----------------------------------------------------------------

	filetype on							"vim filetype on
	"nnoremap <silent><F4> :TlistToggle<CR>
	nmap <F4> :TlistToggle<CR>			"F4 Key = Tag List Toggling
	let Tlist_Ctags_Cmd = "/usr/bin/ctags"	"ctags prog location
	let Tlist_Inc_Winwidth = 0				"window width change off
											"window close = off
	let Tlist_Auto_Open = 0
	let Tlist_Use_Right_Window = 1
	let Tlist_WinWidth = 30					" taglist width
	let Tlist_Show_One_File = 1

	let Tlist_Exit_OnlyWindow = 1

	let Tlist_Use_Right_Window = 1

	let Tlist_File_Fold_Auto_Close=1

	let Tlist_Auto_Update = 1

	let Tlist_Hightlight_Tag_On_BufEnter = 1

	let Tlist_Enable_Fold_Column = 0

	let Tlist_Process_File_Always = 1

	let Tlist_Display_Prototype = 0

	let Tlist_Compact_Format = 1

	
"-----------------------------------------------------------------
" Source Explorer env settings
"-----------------------------------------------------------------
	nmap <F5> :SrcExplToggle<CR>			"F5 Key = SrcExpl Toggling
	nmap <C-H> <C-W>h						" move left
	nmap <C-J> <C-W>j						" move down
	nmap <C-K> <C-W>k						" move up
	nmap <C-L> <C-W>l						" move rihgt

	let g:SrcExpl_winHeight = 12
	let g:SrcExpl_refreshTime = 100
	let g:SrcExpl_jumpKey = "<ENTER>"
	let g:SrcExpl_gobackKey = "<SPACE>"		"back
	let g:SrcExpl_isUpdateTags = 0			"tag file update = off
    let g:SrcExpl_prevDefKey = "<F11>"      "Set "<F11>”key for displaying the previous definition in the jump list
    let g:SrcExpl_nextDefKey = "<F12>"      "Set "<F12>”key for displaying the next definition in the jump list

":cs find {querytype} {name}


"{querytype}
"
"       0 or s   —— find C symbol
"
"       1 or g  —— find definition
"
"       2 or d  —— find called functions
"
"       3 or c  —— find the callers
"
"       4 or t  —— find string
"
"       6 or e  —— find egrep match
"
"       7 or f  —— find file
"
"       8 or i  —— find who #include the file
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"-----------------------------------------------------------------

" plugin - NERD_tree.vim

"-----------------------------------------------------------------

" F3 to toggle NERDTree

map <F3> :NERDTreeToggle<CR>

imap <F3> <ESC>:NERDTreeToggle<CR>





"-----------------------------------------------------------------

" plugin - NERD_commenter.vim   help to comment code

" [count],cc add comments in the below count lines

" [count],cu delete comments in the below count lines

" [count],cm add block comments in the below count lines


"-----------------------------------------------------------------

let NERDSpaceDelims=1

let NERDCompactSexyComs=1


"-----------------------------------------------------------------

" plugin - DoxygenToolkit.vim

"-----------------------------------------------------------------

let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"

let g:DoxygenToolkit_briefTag_funcName="yes"

map <leader>da :DoxAuthor<CR>

map <leader>df :Dox<CR>

map <leader>db :DoxBlock<CR>

map <leader>dc a /*  */<LEFT><LEFT><LEFT>







"-----------------------------------------------------------------

" plugin - NeoComplCache.vim    auto-complete plugin

"-----------------------------------------------------------------

let g:AutoComplPop_NotEnableAtStartup = 1

let g:NeoComplCache_EnableAtStartup = 1

let g:NeoComplCache_SmartCase = 1

let g:NeoComplCache_TagsAutoUpdate = 1

let g:NeoComplCache_EnableInfo = 1

let g:NeoComplCache_EnableCamelCaseCompletion = 1

let g:NeoComplCache_MinSyntaxLength = 3

let g:NeoComplCache_EnableSkipCompletion = 1

let g:NeoComplCache_SkipInputTime = '0.5'

let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'

" <TAB> completion.

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" snippets expand key

imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)

smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)



"-----------------------------------------------------------------

" plugin – a.vim

"-----------------------------------------------------------------
