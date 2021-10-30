" Settings
"
set ignorecase              " case insensitive 
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=2            " width for autoindents
set expandtab               " converts tabs to white space
set number                  " add line numbers
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
"set spell                   " enable spell check (may need to download language package)
filetype plugin indent on   " allow auto-indenting depending on file type
syntax enable               " syntax highlighting

" Keybindings
"
nnoremap <ESC> :noh<CR><CR> 
nnoremap <C-x><C-f> :FZF<CR>
nnoremap <A-0> :NERDTreeFocus<CR>

" Plugins
"
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'mhinz/vim-startify' 
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

" NERDTree
"
autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
autocmd BufWinEnter * call PreventBuffersInNERDTree()

function! PreventBuffersInNERDTree()
  if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
    \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
    \ && &buftype == '' && !exists('g:launching_fzf')
    let bufnum = bufnr('%')
    close
    exe 'b ' . bufnum
    NERDTree
  endif
  if exists('g:launching_fzf') | unlet g:launching_fzf | endif
endfunction

" Theme
"
let g:dracula_colorterm = 0
colorscheme dracula

let s:blue = "61bfff"
let g:WebDevIconsDefaultFolderSymbolColor = s:blue
highlight Directory guifg=#FF0000 ctermfg=NONE

" Startup
"
autocmd VimEnter * if argc() == 0 | Startify | endif " startify if opened without arguments
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p " go back to previous focused window on startup (Startify)
