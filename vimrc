set cursorline

set cursorcolumn

set number
set relativenumber


syntax on
set scrolloff=8   
set sidescrolloff=8 

set hlsearch   
set incsearch  

inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

nnoremap <C-d> :q!<CR>  
nnoremap <C-q> :q<CR>   " Ctrl+Q для выхода из Vim
nnoremap <C-s> :w<CR>   " Ctrl+S для сохранения
