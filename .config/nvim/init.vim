"Franklin Souza
"@FranklinTech
                                                  
" Dicas: 

" Abrir um novo arquvio:
" :vnew arquivo

" :split (arquivo) e :vsplit (arquivo)

" :CocRestart -> Para reiniciar o Coc

"Vim-Plug
"https://github.com/junegunn/vim-plug#neovim

call plug#begin('~/.config/nvim/plugged')

"Auto-Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Commenter
Plug 'preservim/nerdcommenter'

"Icons File Manager
Plug 'ryanoasis/vim-devicons'

"NerdTree
Plug 'preservim/nerdtree'

"Syntax
Plug 'sheerun/vim-polyglot'

"Terminal
Plug 'tc50cal/vim-terminal'

"Vim-Airlines
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Multiple Cursores
Plug 'terryma/vim-multiple-cursors'

"Syntax Check
Plug 'dense-analysis/ale'

"JS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

"Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"VirtualEnv
Plug 'jmcantrell/vim-virtualenv'

"WebIcons
Plug 'cj/vim-webdevicons'

"MediaWiki
Plug 'm-pilia/vim-mediawiki'

"Minimap
Plug 'koron/minimap-vim'

"AutoSave
Plug '907th/vim-auto-save'

"QuickRun
Plug 'thinca/vim-quickrun'

call plug#end()
 
"Cursor
set cursorline
highlight clear CursorLine
highlight CursorLine ctermbg=235

"Set Nvim
set number
"set incsearch
set autoindent
set wildmenu
set laststatus=2
set confirm
"set tabstop=4
set title
set mouse=a
"set relativenumber
"syntax on
filetype on
"set termguicolors
set expandtab
set shiftwidth=2
set encoding=UTF-8
"set encoding=utf-8
set autowrite
"set cursorline
set noswapfile
set hidden
set inccommand=split
set guifont=JetBrains\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 8
set clipboard=unnamedplus
set incsearch ignorecase smartcase hlsearch

"Leader Key
let mapleader="\<space>"

"Others Configs
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline_extensions = []
let g:airline#extensions#tabline#enabled = 1
"let g:airline_left_sep = "\uE0B4"
"let g:airline_right_sep = "\uE0B6"
"let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:vim_mediawiki_site = 'https://wiki.archlinux.org/index.php/Main_page'


"Terminal
nnoremap <leader>t :vsplit term://zsh<cr>A

"Ale
nnoremap <F9> :ALEFix<cr>

"NerdTree
nnoremap <C-l> :NERDTreeToggle<CR>

"Duplicate Line
nnoremap <c-d> <esc>:t.<cr>

"Comment Code
nmap <C-_>   <Plug>NERDCommenterToggle
xmap <C-_>   <Plug>NERDCommenterToggle<CR>

"Map
map q :q<CR>
map <C-q> :q!<CR>
map <C-s> :w!<CR>
map t :Tutor<CR>
map r :PlugInstall<CR>
map <C-k> :vnew<CR>
map <C-x> :s/$/
map \ :AutoSaveToggle<CR> 

"Mover bloco de código selecionado
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

"Move Lines
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

"Lista suspensa
inoremap <silent><expr> <c-space> coc#refresh()

"Copiar e Colar
vmap cp "+y
nmap c "+p
