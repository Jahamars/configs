# " я пока не исползую vim или neovim по этому этот конфиг временно не пригодно для исползование 
# set number
# 
# " Установка отступов
# set tabstop=4
# set shiftwidth=4
# set expandtab
# 
# " Включение подсветки синтаксиса
# syntax on
# 
# " Включение автодополнения
# set completeopt=menuone,noselect
# 
# " подключение плагинов 
# call plug#begin('~/.local/share/nvim/plugged')
# 
# Plug 'morhetz/gruvbox' " Тема Gruvbox
# Plug 'nvim-lua/completion-nvim' " completion-nvim: Плагин для автодополнени
# Plug 'francoiscabrol/ranger.vim' " Ranger интеграция
# Plug 'tpope/vim-commentary' " Плагин для комментирования кода
# 
# call plug#end()
# syntax enable
# set background=dark " Или light для светлой темы или dark для темной 
# colorscheme gruvbox
# 
# 
# 
# " Настройка клавиш для сохранения и выхода
# nnoremap <C-s> :w<CR>
# inoremap <C-s> <C-o>:w<CR>
# vnoremap <C-s> <C-c>:w<CR>
# 
# nnoremap <C-q> :q<CR>
# inoremap <C-q> <Esc>:q<CR>
# vnoremap <C-q> <Esc>:q<CR>
# 
# "полупрозрачность
# " Установка прозрачного фона
# hi Normal guibg=NONE ctermbg=NONE
# 
# " Настройка Ctrl+Z для отмены последнего действия
# nnoremap <C-z> u
# inoremap <C-z> <C-o>u
# vnoremap <C-z> <Esc>u
# 
# let mapleader = ","
# nnoremap <leader>r :Ranger<CR>
# 
# 
