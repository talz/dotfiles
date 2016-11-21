syntax on
set background=dark

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au BufRead,BufNewFile *.thrift setfiletype thrift 
autocmd FileType qf wincmd J
"autocmd CompleteDone * pclose

if filereadable("/etc/vim/vimrc.local")
 source /etc/vim/vimrc.local
endif

execute pathogen#infect()

filetype plugin indent on

"set ignorecase
"set smartcase 
"set clipboard=unnamed
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

set backspace=indent,eol,start
set runtimepath^=~/.vim/bundle/ctrlp.vim

set t_Co=256

"let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

let g:ctrlp_working_path_mode = 'a'
"let g:ctrlp_user_command = 'find %s -regex ".+\.\(py\|m\|mm\|java\|aidl\|c\|cpp\|cc\|cxx\|h\|hpp\|ipp\|cs\|mk\|xml\|gradle\|json\|js\|css\|html\|jsx\)$" -type f ! -path "*/boost/*" ! -path "*/intermediates/*" ! -path "*/bin/*" ! -path "*/gen/*" ! -path "*/sdk/*" ! -path "*/build*" ! -path "*/prebuilt/*" ! -path "*/obj/*" ! -path "*/.repo/*" ! -path "*/.git/*" ! -path "*/.idea/*"'

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --ignore .git --ignore .svn --ignore .hg --ignore .DS_Store --ignore "**/*.pyc" --ignore "*/boost/*" --ignore "*/intermediates/*" --ignore "*/bin/*" --ignore "*/gen/*" --ignore "*/sdk/*" --ignore "*/build*" --ignore "*/prebuilt/*" --ignore "*/obj/*" --ignore "*/.repo/*" --ignore "*/.git/*" --ignore "*/.idea/*" -g "\.(py|m|mm|java|aidl|c|cpp|cc|cxx|h|hpp|ipp|cs|mk|xml|gradle)"'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"let grepprg=ag\ --nogroup\ --nocolor
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let grepprg="ag --nogroup --nocolor"
let g:ctrlp_use_caching=1

let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=1
let g:clang_complete_debug=1
let g:clang_use_library=1


"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"nnoremap \ :Ag<SPACE>

let Cscope_JumpError=0
let Tlist_WinWidth=55
"let Tlist_Use_Right_Window=1
let Tlist_Use_Right_Window=0
let Tlist_File_Fold_Auto_Close=1
let NERDTreeWinSize=55
let NERDTreeIgnore = ['\(\.pyc\|cscope.files\|cscope.out\|tags\)$']

"let g:tmux_navigator_no_mappings = 1
"
cnoreabbrev NF NERDTreeFind

nnoremap <silent> <C-w><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-w><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-w><C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-w><C-\> :TmuxNavigatePrevious<cr>

map <F3> :TlistClose<CR>:NERDTreeToggle<CR>
map <F4> :NERDTreeClose<CR> :Tlist<CR>

map <F6> :cp<CR>
map <F7> :cn<CR>

map <C-p> :CtrlP<CR>
map <C-b> :CtrlPBuffer<CR>

map <C-Tab> :tabn<CR>
map <C-S-Tab> :tabp<CR>

colorscheme monokai
