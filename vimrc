execute pathogen#infect() 
set nocompatible

filetype indent plugin on 
syntax on

set hidden
set autoindent
set ruler
set nostartofline
set laststatus=2

set confirm
set visualbell
set mouse=a
set number

set shiftwidth=2
set softtabstop=2
set expandtab
set spelllang=en_gb


au VimEnter * RainbowParenthesesToggleAll

"Indent guide
let g:indent_guides_auto_colors = 0
let g:vim_markdown_folding_disabled=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
autocmd BufRead,BufNewFile *.md setlocal spell



if has("win32")
  set directory=c:\\tmp,c:\\temp
elseif has("unix")
  set directory=/tmp
endif

"Disable cursor keys to force use of h,j,k,l
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Right> <NOP>
noremap <Left> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Right> <NOP>
inoremap <Left> <NOP>

"Map jk in insert mode to <esc>
inoremap jk <ESC> 
