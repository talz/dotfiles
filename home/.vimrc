syntax on
set background=dark

set runtimepath+=~/.vim/bundle/swift.vim

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au BufRead,BufNewFile *.thrift setfiletype thrift 
autocmd FileType qf wincmd J
"autocmd CompleteDone * pclose

if filereadable("/etc/vim/vimrc.local")
 source /etc/vim/vimrc.local
endif

execute pathogen#infect()

filetype plugin indent on

set ignorecase
"set smartcase 
set clipboard=unnamed
set showcmd	 
set showmatch 
set incsearch 
set autowrite 
set hidden  
set nu
set relativenumber
set hlsearch
set nobackup
set nowritebackup
set noswapfile
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set cursorline
"set ttimeout
"set ttimeoutlen=250
"set notimeout
"
highlight BadWhitespace ctermbg=red guibg=darkred
au BufNewFile,BufRead *.py match Error /\s\+$/
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set textwidth=99
au BufNewFile,BufRead *.py set colorcolumn=100
au BufNewFile,BufRead *.py set fileformat=unix
au BufNewFile,BufRead *.py set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
au BufNewFile,BufRead *.py set errorformat=%f:%l:\ %m

autocmd FileType python setlocal completeopt-=preview




"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


set backspace=indent,eol,start
set runtimepath^=~/.vim/bundle/ctrlp.vim

set t_Co=256

"let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

let g:ctrlp_working_path_mode = 'a'
let grepprg="ag --nogroup --nocolor"
"let g:ctrlp_use_caching=0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|obj)$',
  \ 'link': '',
  \ }

if has("mac")
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
endif
"let g:clang_library_path = '/usr/lib/llvm-3.8/lib/'
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=1
let g:clang_complete_debug=1
let g:clang_use_library=1
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 0



"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"nnoremap \ :Ag<SPACE>

let Cscope_JumpError=0
let Tlist_WinWidth=55
"let Tlist_Use_Right_Window=1
let Tlist_Use_Right_Window=0
let Tlist_File_Fold_Auto_Close=1
let NERDTreeWinSize=45
let NERDTreeIgnore = ['\(\.pyc\|cscope.files\|cscope.out\|tags\)$']

"let g:tmux_navigator_no_mappings = 1
"
cnoreabbrev NF NERDTreeFind

nnoremap <silent> <C-w><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-w><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-w><C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-w><C-\> :TmuxNavigatePrevious<cr>

nnoremap <leader>gd :!git diff %:p<CR>
nnoremap <leader>gl :!git log -p %:p<CR>
nnoremap <leader>ko :A<CR>

map <F3> :TlistClose<CR>:NERDTreeToggle<CR>
map <F4> :NERDTreeClose<CR> :Tlist<CR>

map <F6> :cp<CR>
map <F7> :cn<CR>

map <C-p> :CtrlP<CR>
map <C-b> :CtrlPBuffer<CR>

map <C-Tab> :tabn<CR>
map <C-S-Tab> :tabp<CR>


nnoremap <leader>ko :A<CR>

colorscheme atom-dark

if filereadable(".vimrc.local")
    source .vimrc.local
endif

hi Normal guibg=NONE ctermbg=NONE

