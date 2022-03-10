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

"VirtualEnv
Plug 'jmcantrell/vim-virtualenv'

"WebIcons
Plug 'cj/vim-webdevicons'

"MediaWiki
"Plug 'm-pilia/vim-mediawiki'

"Minimap
"Plug 'koron/minimap-vim'
"Plug 'wfxr/minimap.vim'

"AutoSave
Plug '907th/vim-auto-save'

"QuickRun
Plug 'thinca/vim-quickrun'

"Pywal
Plug 'dylanaraps/wal.vim'

"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

"Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Indent Blank
"Plug 'lukas-reineke/indent-blankline.nvim'

"Plug 'RishabhRD/popfix'
"Plug 'RishabhRD/nvim-cheat.sh'

"Dashboard
Plug 'glepnir/dashboard-nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Plug 'liuchengxu/vim-clap'
"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

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
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline_extensions = []
let g:airline#extensions#tabline#enabled = 1
"let g:airline_left_sep = "\uE0B4"
"let g:airline_right_sep = "\uE0B6"
let g:airline_section_z = airline#section#create(['%{line(".")}' . "/" . '%{col(".")}'])
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:vim_mediawiki_site = 'https://wiki.archlinux.org/index.php/Main_page'

" Minimap
let g:minimap_width = 20
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f
let g:minimap_highlight = 'MinimapCurrentLine'
let g:minimap_highlight_range = 1

"Markdown
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']

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
map <F8> :colorscheme wal<CR>
map <C-i> :FZF<CR>

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

"Markdown
"nmap <C-p> <Plug>MarkdownPreview
nmap <C-p> <Plug>MarkdownPreviewToggle

"Dashboard
"vim.g.dashboard_preview_command = 'cat'
"vim.g.dashboard_preview_pipeline = 'lolcat'
"vim.g.dashboard_preview_file = ~/.config/nvim/neovim.cat
"vim.g.dashboard_preview_file_height = 12
"vim.g.dashboard_preview_file_width = 80

"let g:dashboard_custom_header = [
   "\'        ▄▄▄▄▄███████████████████▄▄▄▄▄     ',
   "\'      ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄   ',
   "\'     █▀████████▄             ▀▀████ ▀██▄  ',
   "\'    █▄▄██████████████████▄▄▄         ▄██▀ ',
   "\'     ▀█████████████████████████▄    ▄██▀  ',
   "\'       ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀    ',
   "\'         ▀███▄              ▀██████▀      ',
   "\'           ▀██████▄        ▄████▀         ',
   "\'              ▀█████▄▄▄▄▄▄▄███▀           ',
   "\'                ▀████▀▀▀████▀             ',
   "\'                  ▀███▄███▀                ',
   "\'                     ▀█▀                   ',
   "\'',
   "\'                [@FranklinTech]             ',
   "\ ]

let g:dashboard_custom_header = [
    \ '       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
    \ '       ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
    \ '       ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
    \ '       ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    \ '       ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
    \ '       ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
    \ '',
    \ 'Fork of Vim aiming to improve user experience, plugins, and GUIs',
    \ ]

"let g:dashboard_custom_header = [
   "\' ███████████████████████████ ',
   "\' ███████▀▀▀░░░░░░░▀▀▀███████ ',
   "\' ████▀░░░░░░░░░░░░░░░░░▀████ ',
   "\' ███│░░░░░░░░░░░░░░░░░░░│███ ',
   "\' ██▌│░░░░░░░░░░░░░░░░░░░│▐██ ',
   "\' ██░└┐░░░░░░░░░░░░░░░░░┌┘░██ ',
   "\' ██░░└┐░░░░░░░░░░░░░░░┌┘░░██ ',
   "\' ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██ ',
   "\' ██▌░│██████▌░░░▐██████│░▐██ ',
   "\' ███░│▐███▀▀░░▄░░▀▀███▌│░███ ',
   "\' ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██ ',
   "\' ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██ ',
   "\' ████▄─┘██▌░░░░░░░▐██└─▄████ ',
   "\' █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████ ',
   "\' ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████ ',
   "\' █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████ ',
   "\' ███████▄░░░░░░░░░░░▄███████ ',
   "\' ██████████▄▄▄▄▄▄▄██████████ ',
   "\ ]

let g:dashboard_default_executive ='telescope'
let s:footer = []
"let g:dashboard_custom_header = s:header
let g:dashboard_custom_footer = s:footer

"vim.g.dashboard_custom_section = {
  "a = {description = {'  Find File          '}, command = 'Telescope find_files'},
  "d = {description = {'  Search Text        '}, command = 'Telescope live_grep'},
  "b = {description = {'  Recent Files       '}, command = 'Telescope oldfiles'},
  "e = {description = {'  Config             '}, command = 'edit ~/.config/nvim/init.vim'}
"}

"vim.g.dashboard_custom_footer = [Do one thing, do it well - Unix Philosophy]

"Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
