set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle "gmarik/vundle"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "scrooloose/nerdtree"
Bundle "jistr/vim-nerdtree-tabs"
Bundle "fholgado/minibufexpl.vim"
Bundle "kien/ctrlp.vim"
Bundle "vim-scripts/dbext.vim"
Bundle "vim-scripts/taglist.vim"
Bundle "vim-scripts/utags"
Bundle "scrooloose/Syntastic"
Bundle "Valloric/YouCompleteMe"
"Bundle "vim-scripts/Python-mode-klen"
"Bundle "vim-scripts/AutoComplPop"
"Bundle "fisadev/vim-debug.vim"
Bundle "epeli/slimux"
"Bundle "gotcha/vimpdb"
"Bundle "garbas/vim-snipmate"
Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"
Bundle "ervandew/supertab"
Bundle "hynek/vim-python-pep8-indent"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "terryma/vim-multiple-cursors"
Bundle "vim-scripts/vim-auto-save"
Bundle "bling/vim-airline"
Bundle "justinmk/vim-sneak"
Bundle "ConradIrwin/vim-bracketed-paste"
"Bundle "Shougo/unite.vim"
"Bundle "Shougo/vimproc.vim"
Bundle "junegunn/goyo.vim"
"Bundle "tpope/vim-markdown"
"Bundle "vim-scripts/SyntaxRange"
"Bundle "tybenz/vimdeck"
Bundle "elzr/vim-json"

syntax on
filetype plugin indent on
set showcmd
set cursorline
set cursorcolumn
set showmatch
set noswapfile
let loaded_matchparen=1
set title
set virtualedit=onemore             " Allow for cursor beyond last character
set laststatus=2                    " Always show the statusline
set spelllang=en_us
hi MatchParen cterm=underline ctermbg=green ctermfg=blue

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeShowHidden=1
"autofocus to the opened tab
"autocmd BufNew * wincmd l

let g:mapleader=","

"TODO: should be set only on .sql files
let g:dbext_default_profile_vinnie = 'type=MYSQL:user=sina:dbname=temp:port=3306:cmd_terminator=;'
let g:dbext_default_profile_local = 'type=MYSQL:user=root:dbname=temp'
let g:dbext_default_profile_enzo = 'type=MYSQL:user=sina:dbname=temp:port=3306'
let g:dbext_default_profile = 'vinnie'
let g:dbext_default_MYSQL_cmd_terminator = ";"
"The above command doesnt work for some reason and each time vim is started
"this line is used :DBSetOption cmd_terminator=;
"run it after the first execution of a query, otherwise it fails -.-

"NERDTree
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"dbext
"nnoremap <Leader><C-j> :DBExecSQLUnderCursor<CR> 
nnoremap <Leader><C-j> vip:DBExecVisualSQL<CR> 
"inoremap <C-@> <C-Space>
"inoremap <Leader>, <C-x><C-k>

set tags=$VIRTUAL_ENV/tags,~/tags;/
"TagList
let g:Tlist_Ctags_Cmd='/usr/bin/ctags'
let g:Tlist_Use_Right_Window=1
let g:Tlist_Auto_Open=1
let g:Tlist_File_Fold_Auto_Close=1
let g:Tlist_Highlight_Tag_On_BufEnter=1
map <F3> :TlistToggle<CR>

colorscheme molokai

" vim-indent-guides
set ts=2 sw=2 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=234
let g:indent_guides_enable_on_vim_startup = 1


"dbext
"TODO: should only run on .sql files
"autocmd VimEnter * DBCompleteTable
let g:dbext_cmd_terminator=';'
"let g:ftplugin_sql_omni_key = '<C-Q>'
"let  g:dbext_default_DBI_cmd_terminator = ';'

" Highlight all instances of word under cursor, when idle.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
	let @/ = ''
	if exists('#auto_highlight')
		au! auto_highlight
		augroup! auto_highlight
		setl updatetime=4000
		echo 'Highlight current word: off'
		return 0
	else
		augroup auto_highlight
			au!
			au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
		augroup end
		setl updatetime=500
		echo 'Highlight current word: ON'
		return 1
	endif
endfunction
"call AutoHighlightToggle()
"

"show whitespace as underscore and tab as bar
"taken from http://stackoverflow.com/a/11202502
set list listchars=tab:\|\ 
highlight Whitespace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=8 guifg=8
autocmd ColorScheme * highlight Whitespace gui=underline ctermbg=NONE guibg=NONE ctermfg=8 guifg=8
match Whitespace /  \+/


" configure expanding of tabs for various file types
" taken from http://stackoverflow.com/a/65122
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
" --------------------------------------------------------------------------------
"  " configure editor with tabs and nice stuff...
"  "
"  --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
"
" make backspaces more powerfull
set backspace=indent,eol,start
"
set ruler                           " show line and column number
"  syntax on   			" syntax highlighting
"  set showcmd 			" show (partial) command in status line


"show line numbers
set number

" set ctrl-c to copy the selection, super coolr
" http://vim.wikia.com/wiki/In_line_copy_and_paste_to_system_clipboard
vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u

set statusline=%F%m%r%h%w\ [%Y\ %{&ff}]\ [%l/%L\ (%p%%)]\ %c

set history=700
set undolevels=700

"better marks, swap the behaviour
nnoremap ' `
nnoremap ` '

set textwidth=0 
set wrapmargin=0

set pastetoggle=<F2>

map <F5> :setlocal spell! spelllang=en_us<CR>

" navigate based on position rather than line
nmap j gj
nmap k gk

"avoid accidently removing recently typed line/word by pressing ctrl-u
"this mapping makes the loss recoverable by pressing u in normal mode
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" map ctrl+/ to do vimgrep on the current word. Mapping is on <C-_> 
" because vim registers underscore as slash. 
" To see that: In insert mode after pressing ctrl+v do ctrl+/
nmap <C-_> :vimgrep /<c-r><c-w>/ **

"use enter and shift enter to insert new lines
"nmap <S-Enter> O<Esc>
"nmap <CR> o<Esc>
"press space to insert space in normal mode 
"nmap <Space> i <Esc>l


noremap <Leader>s :SlimuxREPLSendSelection<CR>
noremap <Leader>l :SlimuxREPLSendLine<CR>

"toggle to manual MBE start
"let g:miniBufExplorerAutoStart=0

" Syntastic
let g:syntastic_mode_map = { 'mode' : 'active' }
let g:syntastic_python_checkers = ['pylint', 'pep8']
let g:syntastic_aggregate_errors = 1
let g:syntastic_quiet_messages = { "level": "warnigs", "regex": 'E501' }
"if vim becomes slow after save try these flags
let g:syntastic_enable_highlighting = 0
"let g:syntastic_echo_current_error = 0

"undo history was lost on buffer switch, perserve them!
set hidden

" automatically delete trailing white-spaces for .py files upon save
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre *.py :%s/\s\+$//e

" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase
" searching
set hlsearch
set incsearch
nmap \q :nohlsearch<CR>

"noremap <C-n> :MBEbf<CR>
"noremap <C-p> :MBEbb<CR>
"

" get back where you were after editing another buffer
nmap <C-e> :e#<CR>

" ultisnips
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<s-tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" taken from http://stackoverflow.com/a/22253548 
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


"function! g:UltiSnips_Complete()
"    call UltiSnips#ExpandSnippet()
"    if g:ulti_expand_res == 0
"        if pumvisible()
"            return "\<C-n>"
"        else
"            call UltiSnips#JumpForwards()
"            if g:ulti_jump_forwards_res == 0
"               return "\<TAB>"
"            endif
"        endif
"    endif
"    return ""
"endfunction
"
"autocmd BufEnter * exec "inoremap <buffer> <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-e>"

"vim-auto-save
"let g:auto_save = 1

"vim airline buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
let g:airline_section_z = '%p%% : %l/%L : %c'
"call airline#part#define_accent(


"Unite
"nnoremap <space>/ :Unite grep:.<CR>

"presenting.vim
au FileType rst let b:presenting_slide_separator = '\v(^|\n)\~{4,}'

" Override * and g* to not move the cursor and always set hls.
map * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
map g* :let @/ = expand('<cword>')\|set hlsearch<C-M>
