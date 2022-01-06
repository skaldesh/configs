""" --- Plugins ---
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" LSP (Go)
Plug 'neovim/nvim-lspconfig'

" Deoplete, for asynchronous code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" NERDTree, as project explorer
Plug 'preservim/nerdtree'

" fzf, for fuzzy searching files
Plug '/usr/bin/fzf' " Uses system fzf binary installed via pacman.
Plug 'junegunn/fzf.vim'

" Treesitter for better syntax highlighting.
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" OneDark Theme.
Plug 'navarasu/onedark.nvim'

" go.nvim as modern go plugin for neovim
" Offers several convenience commands, such as GoAddTags etc.
Plug 'ray-x/go.nvim'

" which-key
" Shows available key bindings whilst typing them.
Plug 'folke/which-key.nvim'

" lsp signature
" Shows LSP signature floating window whilst typing.
Plug 'ray-x/lsp_signature.nvim'

call plug#end()


""" --- Settings ---
set cmdheight=1
set clipboard+=unnamedplus
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" open new split panes to right and below (as you probably expect)
set splitright
set splitbelow
set timeoutlen=500

" change the leader key from "\" to " "
let mapleader=","

"" NERDTree
" Show .files by default
let NERDTreeShowHidden=1

"" Deoplete / Deoplete-go
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#use_cache = 1

"" fzf
let g:fzf_command_prefix = 'Fzf'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

"" Onedark
let g:onedark_style = 'darker'
colorscheme onedark


""" --- Imports ---
lua require("go_nvim_config")
lua require("treesitter_config")
lua require("which_key_config")
"lua require("lsp_signature")


""" --- Mappings ---
"" General
" Remap ctrl+c to esc. c, because of Cancel
inoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
nnoremap r<C-c> r<Esc>
nnoremap <C-w><C-c> <C-w><Esc>
" Move lines up and down. Uses @a register instead of @".
nnoremap <C-Up> <Up>"add"ap<Up>
nnoremap <C-Down> "add"ap

"" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

"" fzf
nnoremap <C-p> :FzfFiles<CR>

"" Go

""" --- Commands ---
"" General
" Defines the :C command that clears the current pattern search.
command C let @/=""


""" --- Autocommands ---
"" NERDTree
" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Go.nvim
autocmd BufWritePre *.go silent! lua require('go.format').goimport()

