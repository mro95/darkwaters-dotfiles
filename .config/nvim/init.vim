""""""""""""
"" Neovim configuration
"" Assembled by Darkwater
"" 50% stolen from other people
""

call plug#begin()

" UI plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }
Plug 'majutsushi/tagbar',   { 'on': 'Tagbar'   }

" Git helpers
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Format/syntax helpers
Plug 'tpope/vim-commentary'
Plug 'benekastah/neomake'
Plug 'godlygeek/tabular'

" Specific language enhancers
Plug 'idanarye/vim-dutyl',  { 'for': 'd'   }
Plug 'lervag/vimtex',       { 'for': 'tex' }

" Miscellaneous shit
Plug 'vim-scripts/JavaDecompiler.vim'
Plug 'moll/vim-bbye'
Plug 'mhinz/vim-startify'

" Extra syntax support
Plug 'hail2u/vim-css3-syntax'
Plug 'dag/vim-fish'
Plug 'tikhomirov/vim-glsl'
Plug 'tfnico/vim-gradle'
Plug 'othree/html5.vim'
Plug 'groenewege/vim-less'
Plug 'derekwyatt/vim-scala'
Plug 'udalov/kotlin-vim'
Plug 'statianzo/vim-jade'
Plug 'octol/vim-cpp-enhanced-highlight'

" PHP
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

call plug#end()

""""""""""""""""""""
"" Settings
""

set cursorline
set hidden
set hlsearch
set ignorecase
set incsearch
set list
set number
set ruler
set showcmd
set showmode
set smartcase
set splitbelow
set splitright
set title
set undofile
set wildmenu
set wrap

set backspace=start,eol,indent
set background=dark
set completeopt=menu,preview
set encoding=utf8
set foldcolumn=1
set foldmethod=manual
set history=1000
set laststatus=0
set lcs=tab:··,trail:░,nbsp:%
set mouse=a
set numberwidth=5
set pastetoggle=<F11>
set scrolloff=5
set showtabline=2
set tags+=.tags
set textwidth=120
set timeoutlen=400
set undolevels=1000
set updatetime=1500
set viewoptions=cursor,folds
set wildchar=<Tab>
set wildmode=longest,list
set winminwidth=20
set winwidth=80

" Indentation
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4

colors tomorrow-night
syntax on
filetype plugin indent on

" Startify 
let g:startify_bookmarks = [ { '.c': '~/.config/' },
                           \ { '.j': '~/.js/' },
                           \ { '  ': '' },
                           \ { 've': '~/.nvimenv' },
                           \ { 'vi': '~/.config/nvim/init.vim' },
                           \ { 'vc': '~/.config/nvim/colors/tomorrow-night.vim' },
                           \ { '  ': '' },
                           \ { 'pd': '~/dotfiles/' },
                           \ { 'si': '~/projects/sinuss/volumes/code/' }]




"""""""""""""
"" Mappings
""

" ^S for save
nnoremap    <silent> <C-s>      :w<CR>
vnoremap    <silent> <C-s>      <C-c>:w<CR>
inoremap    <silent> <C-s>      <C-c>:w<CR>

" ^J/^K for tab switching
nnoremap    <silent> <C-k>      :bn<CR>
nnoremap    <silent> <C-j>      :bp<CR>

" ^X to close the current buffer
nnoremap    <silent> <C-x>      :Bdelete<CR>
vnoremap    <silent> <C-x>      <C-c>:Bdelete<CR>

" <Home> ignores leading whitespace
nnoremap    <silent> <Home>     ^
vnoremap    <silent> <Home>     ^
inoremap    <silent> <Home>     <C-o>^

" ^G to jump to a tag
nnoremap    <silent> <C-g>      :tselect /\C^
vnoremap    <silent> <C-g>      <C-c>:tselect /\C^
inoremap    <silent> <C-g>      <C-c>:tselect /\C^

" Easily jump to command line
nnoremap    <silent> \          :
vnoremap    <silent> \          :

" Tab for autocompletion
inoremap    <expr>   <Tab>      InsertTabWrapper()
inoremap    <silent> <S-Tab>    <C-p>

" Make Y consistent with D and C
nnoremap    <silent> Y          y$

" Navigate through quickfix list
nnoremap    <silent> [q         :cp<CR>
nnoremap    <silent> ]q         :cn<CR>

" Remove hlsearch
nnoremap    <silent> <BS>       :nohlsearch<CR>

