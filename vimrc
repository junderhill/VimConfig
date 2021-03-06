execute pathogen#infect() 
set nocompatible

filetype indent plugin on 
syntax on

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

set hidden
set autoindent
set ruler
set nostartofline
set laststatus=2

set confirm
set visualbell
set mouse=a
set number relativenumber

set shiftwidth=2
set softtabstop=2
set expandtab
set spelllang=en_gb

set encoding=utf-8

au VimEnter * RainbowParenthesesToggleAll

"Indent guide
let g:indent_guides_auto_colors = 0
let g:vim_markdown_folding_disabled=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
autocmd BufRead,BufNewFile *.md setlocal spell

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

if has("win32")
  set directory=c:\\tmp,c:\\temp
elseif has("unix")
  set directory=/tmp
endif

"Map jk in insert mode to <esc>
inoremap jk <ESC> 

"Python formattiing
autocmd BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

function! s:goyo_enter()
  set spell
  set noshowmode
  set noshowcmd
  Limelight
  set t_Co=256
  let g:solarized_termcolors=256
  set background=dark
  colorscheme zenburn
  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  set nospell
  set showmode
  set showcmd
  Limelight!
  set t_Co=256
  if !has('gui_running')
    set background=dark
    colorscheme zenburn
  elseif has('gui_running')
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
