"Some (potentially) useful settings that you may or may not want

"Enable relative number to the cursor
"set relativenumber

"""""""""""""""""

"Allow arrow keys to navigate among other things
set nocompatible

"Pathogen - managing RUNTIMEPATH for plugins - https://github.com/tpope/vim-pathogen
execute pathogen#infect()

"Set font and font size
set guifont=Monaco:h12

"Enable syntax highlighting
syntax enable

"Enable identification of file type for syntax highlighting
filetype on

"Enable highlighting of search pattern (use :noh to clear highlight)
set hlsearch

"Enable 20 command history (through up/down arrow)
set history=20

"Enable display of row and column number on cursor position
set ruler
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

"Enable wild menu (CTRL+D in COMMAND MODE)
set wildmenu

"Enable highlighting matching brackets
set showmatch

"Ignore case when all lowercase search string
set ignorecase

"Case sensitive when upper case is specified
set smartcase

"Enable incremental searching
set incsearch

"Configure indent and smart indenting
set smartindent
set cindent

"Set tabs
set tabstop=3
set shiftwidth=3
" This is to insure that spaces are used instead of tab characters
set expandtab

"Display non-display characters (e.g. tab) - enable with ':set list' and disable with ':set nolist'
set listchars=eol:$,tab:>-,trail:~
set list

"Tell VIM to use colors that look better on dark background
set bg=dark

"Enable the mouse
set mouse=a

"Enable line numbers
set number

"Enable line to be highlighted for cursor
set cursorline

"Centralize swap file locations (the // at the end is to prevent same filename conflict)
set directory=~/.vim/swap//

"Use inkpot as default colorscheme
colorscheme inkpot
"colorscheme molokai
"colorscheme tomorrow-night-bright
"colorscheme tomorrow-night
"colorscheme tomorrow-night-eighties

au FileType crontab setlocal bkc=yes

"Paste toggling
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>

"Tell vim to remember certain things when we exit
" '10 : marks will be remembered for up to 10 previously edited files
" "100 : will save up to 100 lines for each register
" :20 : up to 20 lines of command-line history will be remembered
" % : saves and restores the buffer list
" n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

"When we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

"Load tags automatically
let tagDir = "/Users/steven.lai/tools/ctags/"
let tagFile = tagDir . ".tags"
if filereadable(tagFile)
  exec "set tags=" . tagFile
endif

"Plugins installed:
" Pathogen
"   -> https://github.com/tpope/vim-pathogen
"   -> Put plugins in ~/.vim/bundle (default path) and Pathogen can handle many vim config for you
"   -> Use :Helptags to generate help for plugins in ~/.vim/bundle (default location)
" Fugitive -> https://github.com/tpope/vim-fugitive (use :help fugitive for more info)
"   Commands are for current file!
"   :Gblame -> 'git blame'
"   :Gstatus -> 'git status'
" CtrlP
"   Allows 'fuzzy' opening of files by pressing <Ctrl p>

"Ignore files in CtrlP: repo specific, .class, .dll
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(class|dll)$'
    \ }

let g:ycm_confirm_extra_conf = 0
