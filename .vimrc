syntax on                       " Syntax highlighting
""" TODO revise this part
set background=dark             " Terminal with a dark background
set t_Co=256
set expandtab                   " Make a tab to spaces, num of spaces set in tabstop
set shiftwidth=4                " Number of spaces to use for autoindenting
set tabstop=4                   " A tab is four spaces
set smarttab                    " insert tabs at the start of a line according to
set list                        " show invisible characters
set listchars=tab:>-,trail:-    " but only show tabs and trailing whitespace
set numberwidth=3               " Line number width
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight NonText ctermfg=8 guifg=gray

source ~/.vim/cyclecolor.vim
""" End revise

set nowrap
set autoindent
set smartindent
set wildmode=longest,list
set wildmenu
set clipboard=unnamedplus
set incsearch
set hlsearch
set number
set relativenumber
set splitright
set splitbelow
autocmd BufWritePre * %s/\s\+$//e
set pastetoggle=<F2>
nnoremap <C-s> <C-a>
let mapleader=" "
nnoremap <leader>/ :nohlsearch<CR>
nnoremap <C-W><C-F> <C-W>vgf

""" Filetypes
" lua
au BufRead,BufNewFile *.lua set filetype=lua
autocmd FileType lua setlocal commentstring=--\ %s
autocmd FileType lua setlocal colorcolumn=121

" python
autocmd FileType python setlocal colorcolumn=80
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType python set path+=db

" yaml
autocmd FileType yaml setlocal commentstring=#\ %s

" java
autocmd FileType java setlocal colorcolumn=121
autocmd FileType java set path+=src/main/java
autocmd FileType java set path+=src/test/java

" conf
autocmd FileType conf setlocal commentstring=#\ %s

" sshconfig
autocmd FileType sshconfig setlocal commentstring=#\ %s

" vim
autocmd FileType vim setlocal commentstring=\"\ %s

" Bash
autocmd FileType sh setlocal colorcolumn=81

""" Utility
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<CR>

nmap <leader>w :only<CR>
nmap <leader>W :hide<CR>
""" End Utility

""" Colors
hi LineNr ctermfg=6
hi CursorLineNr ctermfg=6
""" End Colors

""" Sideways
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI
""" End Sideways

""" ArgWrap
nnoremap <silent> <leader>a :ArgWrap<CR>
""" End ArgWrap

""" Commentary
""" End Commentary

""" NerdTree
map <leader>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""" NerdTree Git
let g:NERDTreeShowIgnoredStatus = 1
""" End NerdTree

""" minibufexpl
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplBuffersNeeded = 1
""" End minibufexpl

""" CtrlP
let g:ctrlp_max_files=0
""" End CtrlP

""" Closetag
let g:closetag_filetypes = 'xml,html,xhtml'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_close_shortcut = '<leader>>'
""" End Closetag

""" Tabs
noremap <C-t> :tabnew split<CR>
noremap <C-T> :tab split<CR>
""" End Tabs

""" rest-console
let g:vrc_response_default_content_type = 'application/json'
let g:vrc_syntax_highlight_response = 1
""" End rest-console

execute pathogen#infect()
