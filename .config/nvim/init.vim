" ***SETTINGS***
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set incsearch
set scrolloff=8
set cmdheight=2
set termguicolors
set cursorline
set mouse=a
set background=light

" indenting related
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent

" undo history
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

" ***PLUGINS***
call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rose-pine/neovim'
Plug 'sheerun/vim-polyglot'
Plug 'github/copilot.vim'
Plug 'mcchrish/nnn.vim'
Plug 'preservim/nerdtree'
Plug 'farmergreg/vim-lastplace'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'dungatoro/vim-airline-themes'
Plug 'prettier/vim-prettier'
Plug 'machakann/vim-highlightedyank'
Plug 'gko/vim-coloresque'
Plug 'psliwka/vim-smoothie'
Plug 'mhinz/vim-startify'
Plug 'dungatoro/base16-vim'
call plug#end()

" ***PLUGIN SETTINGS***

" rose pine theme
"colorscheme rose-pine

colorscheme base16-paradise-light
" custom bar
let g:airline_theme = 'transparent'

" copilot
let g:copilot_no_tab_map = v:true

" startify
let g:startify_custom_header = [
  \'    ||   / /                                                         ',
  \'    ||  / / ( )  _   __      ___    __  ___  ___      __      ___    ',
  \'    || / / / / // ) )  ) ) //   ) )  / /   //   ) ) //  ) ) //   ) ) ',
  \'    ||/ / / / // / /  / / //   / /  / /   //   / / //      //   / /  ',
  \'    |  / / / // / /  / / ((___( (  / /   ((___/ / //      ((___/ /   ',
  \'',
  \'',
  \ ]

" ***KEYBINDINGS***
let mapleader = " "

" general
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
inoremap <space> <space><c-g>u

vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==

nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>
nnoremap <leader>so :so%<CR>
nnoremap <leader>qs :q!<CR>
nnoremap <C-a> G$vgg0

" vim-plug
nnoremap <leader>pi :PlugInstall<CR>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nnn
nnoremap <leader>nn :NnnPicker<cr>

" nerdtree
nnoremap <leader>nt :NERDTreeToggle<cr>

" goyo
nnoremap <leader>gy :Goyo<cr>

" copilot
inoremap <silent><script><expr> <Right> copilot#Accept("\<CR>")

" startify
nnoremap <leader>st :Startify<cr>

" ***AUTOCOMMANDS***
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TrimWhitespace
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
