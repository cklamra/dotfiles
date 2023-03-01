# vim-plug for nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

python3 -m pip install pynvim jedi flake8

echo "syntax on
filetype plugin indent on
set number
set noswapfile
set undodir=~/.cache/nvim/undo
set undofile
set smartindent
set ic
\"set colorcolumn=80
set expandtab
set showmatch
set encoding=utf-8

call plug#begin()

Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
\"Plug 'vim-syntastic/syntastic'
\"Plug 'vim-scripts/indentpython.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/everforest'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'joshdick/onedark.vim'

call plug#end()

\" theme
\"if has('termguicolors')
\"  set termguicolors
\"endif

\"set background=dark
\"let g:everforest_background='hard' \" 'soft', 'medium', 'hard'
\"let g:everforest_better_performance=1
\"colorscheme everforest
colorscheme onedark

\" python syntax checking
let g:neomake_python_enabled_makers=['flake8']
\"['pylint']
let g:deoplete#enable_at_startup = 1
let python_highligh_all=1

\" window switching
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

\" code folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za


\" F5 to execute python
autocmd FileType python nnoremap <buffer> <F5> :w<cr>:exec '!clear'<cr>:exec '!python3' shellescape(expand('%:p'), 1)<cr>

\" NERDTree
let NERDTreeIgnore=['\\~$', '\\.pyc$', '__pycache__']
let g:nerdtree_tabs_open_on_console_startup=1
autocmd StdinReadPre * let s:std_in=1
\"autocmd VimEnter * NERDTree | if argc() > 0 || exists(\"s:std_in\") | wincmd p | endif
\"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
\"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
\"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\\d\\+' && bufname('%') !~ 'NERD_tree_\\d\\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute \"normal! \\<C-W>w\" | execute 'buffer'.buf | endif
\"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" > ~/.config/nvim/init.vim
nvim -c "PlugInstall | qa"
nvim -c "UpdateRemotePlugins | qa"
