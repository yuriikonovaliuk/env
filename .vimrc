syntax on                       " Syntax highlighting
" TODO revise this part
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
" End revise

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
autocmd BufWritePre * %s/\s\+$//e
set pastetoggle=<F2>
nnoremap <C-s> <C-a>

" Utility
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
" End Utility

" Colors
hi LineNr ctermfg=6
hi CursorLineNr ctermfg=6
" End Colors

execute pathogen#infect()
