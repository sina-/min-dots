" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'scrooloose/Syntastic'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'elzr/vim-json'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'epeli/slimux'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'joonty/vdebug'
" NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'fholgado/minibufexpl.vim'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

"Plugin 'vim-scripts/taglist.vim'
"Plugin 'vim-scripts/utags'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"Plugin 'terryma/vim-multiple-cursors'

"Plugin 'tpope/vim-markdown'
"Plugin 'vim-scripts/SyntaxRange'
"Plugin 'tybenz/vimdeck'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'gotcha/vimpdb'
"Plugin 'garbas/vim-snipmate'
"Plugin 'vim-scripts/Python-mode-klen'
"Plugin 'vim-scripts/AutoComplPop'
"Plugin 'fisadev/vim-debug.vim'

" ======
" Global
" ======

syntax on
filetype plugin indent on
colorscheme molokai

set showcmd
set cursorline
set cursorcolumn
set showmatch
set noswapfile
let loaded_matchparen=1
set title
set virtualedit=onemore
set laststatus=2
set spelllang=en_us
hi MatchParen cterm=underline ctermbg=green ctermfg=blue
let g:mapleader=","
set tags=$VIRTUAL_ENV/tags,~/tags;/
set clipboard=unnamed

"show whitespace as underscore and tab as bar
"taken from http://stackoverflow.com/a/11202502
set list listchars=tab:\|\ 
highlight Whitespace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=8 guifg=8
autocmd ColorScheme * highlight Whitespace gui=underline ctermbg=NONE guibg=NONE ctermfg=8 guifg=8
match Whitespace /  \+/
" configure expansion of tabs for various file types
" taken from http://stackoverflow.com/a/65122
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set backspace=indent,eol,start
set ruler
set number
set statusline=%F%m%r%h%w\ [%Y\ %{&ff}]\ [%l/%L\ (%p%%)]\ %c
set history=700
set undolevels=700
set textwidth=0 
set wrapmargin=0
set pastetoggle=<F2>

" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase

"better marks, swap the behaviour
nnoremap ' `
nnoremap ` '

map <F5> :setlocal spell! spelllang=en_us<CR>

" navigate based on position rather than line
nmap j gj
nmap k gk

" avoid accidently removing recently typed line/word by pressing ctrl-u
" this mapping makes the loss recoverable by pressing u in normal mode
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" undo history was lost on buffer switch, perserve them!
set hidden

" Override * and g* to not move the cursor and always set hls.
map * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
map g* :let @/ = expand('<cword>')\|set hlsearch<C-M>

" searching
set hlsearch
set incsearch
nmap \q :nohlsearch<CR>

" get back where you were after editing another buffer
nmap <C-e> :e#<CR>

" automatically delete trailing white-spaces for .py files upon save
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre *.py :%s/\s\+$//e

" =================
" vim-indent-guides
" =================

set ts=2 sw=2 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=234
let g:indent_guides_enable_on_vim_startup = 0


" ========
" NerdTree
" ========

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeShowHidden=1
"autofocus to the opened tab
"autocmd BufNew * wincmd l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" =====
" dbext
" =====

"TODO: should be set only on .sql files
let g:dbext_default_profile_vinnie = 'type=MYSQL:user=sina:dbname=temp:port=3306:cmd_terminator=;'
let g:dbext_default_profile_local = 'type=MYSQL:user=root:dbname=temp'
let g:dbext_default_profile_enzo = 'type=MYSQL:user=sina:dbname=temp:port=3306'
let g:dbext_default_profile = 'vinnie'
let g:dbext_default_MYSQL_cmd_terminator = ";"
let g:dbext_cmd_terminator=';'

nnoremap <Leader><C-j> vip:DBExecVisualSQL<CR> 
"nnoremap <Leader><C-j> :DBExecSQLUnderCursor<CR> 
"inoremap <C-@> <C-Space>
"inoremap <Leader>, <C-x><C-k>

" ======
" TagList
" ======

let g:Tlist_Ctags_Cmd='/usr/bin/ctags'
let g:Tlist_Use_Right_Window=1
let g:Tlist_Auto_Open=1
let g:Tlist_File_Fold_Auto_Close=1
let g:Tlist_Highlight_Tag_On_BufEnter=1
map <F3> :TlistToggle<CR>

" ======
" Slimux
" ======

noremap <Leader>s :SlimuxREPLSendSelection<CR>
noremap <Leader>l :SlimuxREPLSendLine<CR>

" ===================
" Rainbow parentheses
" ===================

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ==============
" ctrlp
" ==============

let g:ctrlp_use_caching = 0
let g:ctrlp_max_files=0
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" ==============
" presenting.vim
" ==============
au FileType rst let b:presenting_slide_separator = '\v(^|\n)\~{4,}'

" ===================
" vim airline buffers
" ===================
"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
let g:airline_section_z = '%p%% : %l/%L : %c'

" =========
" UltiSnips
" =========

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
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<s-tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" ===
" YCM
" ===

" taken from http://stackoverflow.com/a/22253548 
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" =========
" Syntastic
" =========

let g:syntastic_mode_map = { 'mode' : 'active' }
let g:syntastic_python_checkers = ['pylint', 'pep8']
let g:syntastic_aggregate_errors = 1
let g:syntastic_quiet_messages = { "level": "warnigs", "regex": 'E501' }
" if vim becomes slow after save try these flags
let g:syntastic_enable_highlighting = 0
" let g:syntastic_echo_current_error = 0

" ===================
" nerdtree-git-plugin
" ===================

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ================
" Custom Functions
" ================

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

" set ctrl-c to copy the selection
" http://vim.wikia.com/wiki/In_line_copy_and_paste_to_system_clipboard
vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u

" map ctrl+/ to do vimgrep on the current word. Mapping is on <C-_> 
" because vim registers underscore as slash. 
" To see that: In insert mode after pressing ctrl+v do ctrl+/
nmap <C-_> :vimgrep /<c-r><c-w>/ **
