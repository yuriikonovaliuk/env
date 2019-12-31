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

""" Filetypes
" lua
au BufRead,BufNewFile *.lua set filetype=lua
autocmd FileType lua setlocal commentstring=--\ %s

" python
autocmd FileType python setlocal colorcolumn=80
autocmd FileType python setlocal commentstring=#\ %s

" java
autocmd FileType java setlocal colorcolumn=121
autocmd FileType java setlocal path+=/home/ykonovaliuk/src/jdk/src/java.base/share/classes

" conf
autocmd FileType conf setlocal commentstring=#\ %s

" sshconfig
autocmd FileType sshconfig setlocal commentstring=#\ %s

" vim
autocmd FileType vim setlocal commentstring=\"\ %s

""" Utility
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<CR>

function! OpenUnderCursor(win)
    let filename = "lib/" . substitute(expand('<cword>'), "::", "/", "g") . ".pm"
    let functionname = ""
    if !filereadable(filename)
        let filename = "lib/" . substitute(substitute(expand('<cword>'), ".*\\zs::.*", "", ""), "::", "/", "g") . ".pm"
        let functionname = "sub *" . substitute(expand('<cword>'), ".*::", "", "")
    endif
    let open_command = "edit " . filename
    if (a:win == 0)
        let open_command = "tabedit " . filename
    else
        let open_command = "split " . filename
        let cols = winwidth('%')
        if cols > 170
            let open_command = "v" . open_command
        endif
    endif
    execute open_command
    if strlen(functionname) > 0
        execute "normal /" . functionname . "/e+1\<CR>"
        nohlsearch
    endif
endfunc

nmap <leader>o :call OpenUnderCursor(0)<CR>
nmap <leader>O :call OpenUnderCursor(1)<CR>
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

execute pathogen#infect()
