scriptencoding utf-8     " Represent characters internally on UTF-8

syntax on
set ruler                " Show the cursor position all time
set expandtab            " Inserts space characters whenever tab key is pressed
set ts=2 sw=2            " Set tab size & shift width
set smarttab             " Ensure that tabs are only used for indentation
set number               " Display line numbers
set backspace=2          " Allow backspacing over everything in insert mode
set autoindent           " Auto-indenting off to allow pasting to work by de
set history=10000        " Keeps 50 lines of command history
set undolevels=10000
set showcmd              " Show (partial) command in the last line of the screen
set vb t_vb=             " Disable beep & flash
set showmatch            " Set % key to jump to a matching opening or closing symbols
set ignorecase           " Makes searches case-insensitive
set smartcase            " Override the 'ignorecase' option if the search pattern contains uppercase characters
set incsearch            " While typing a search command, show where the pattern, as it was typed so far, matches
set hlsearch             " When there is a previous search pattern, highlight all its matches
set nobackup             " Make a backup before overwriting a file.  Leave it around after the file has been successfully written
set list                 " Same as :print, but display unprintable characters with '^' and put $ after the line
set pastetoggle=<F2>     " When non-empty, specifies the key sequence that toggles the 'paste' option
set hidden               " Allow switch buffers if one is modified and it ain't saved.
set wildmenu
set ttyfast
set listchars=tab:>-,trail:·
set wildignore=*.swp,*.bak,*.pyc,*.class
set runtimepath^=~/.vim/bundle/ctrlp.vim

let mapleader=","        " Set comma as mapleader key
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme             = 'powerlineish'
let g:airline_powerline_fonts = 1

execute pathogen#infect()

" Buffers {{{
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>c :bd<CR>
nmap <leader>o :enew<CR>
nmap <leader>h :bnext<CR>
nmap <leader>l :bprevious<CR>
nmap <leader>lb :ls<CR>
" }}}

" Theming {{{
set background=dark      " Tells Vim what the background color looks like
color solarized          " Use highlighting from the colors installed on .vim/colors
" }}}

" Disabling default navigation keys {{{
noremap h <NOP>
noremap j <NOP>
noremap k <NOP>
noremap l <NOP>
" }}}

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}

nnoremap <silent> <Leader><Leader> :FZF -m<CR>
nnoremap <silent> <Leader>v :call fzf#run({ 'tmux_width': winwidth('.') / 2, 'sink': 'vertical botright split' })<CR>

nmap <silent> <leader>ev :e $MYVIMRC<CR>    " edit vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>   " source vimrc
nmap <silent> <leader><space> :noh<CR>   " turn off highlight

filetype plugin indent on

cmap w!! w !sudo tee % >/dev/null   " Save with sudo using double !!

imap jk <ESC>

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
nnoremap . :

" Syntastic options {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

nnoremap gV `[v`]        " Visually select the text was last edited/pasted
" Gundo requires vim w python 2.4
"nnoremap <leader>u :GundoToggle<CR>

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

set modelines=1
" vim:foldmethod=marker:foldlevel=0
