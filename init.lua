-- Настройки интерфейса
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard:append("unnamedplus")

-- Синтаксис и скроллинг
vim.cmd("syntax on")
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Поиск
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Маппинги для вставки скобок и кавычек
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true })





-- Маппинги для нормального режима
vim.api.nvim_set_keymap('n', '<A-d>', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-q>', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':wq<CR>', { noremap = true, silent = true })
-- Настройка возврата в нормальный режим при нажатии Alt
vim.api.nvim_set_keymap('i', '<A-space>', '<Esc>', { noremap = true, silent = true })


-- Цветовая схема и поддержка 24-битных цветов
vim.cmd("highlight Normal ctermbg=none guibg=none")
vim.opt.termguicolors = true

-- Настройка плагинов с использованием packer.nvim (рекомендуется для Lua)
-- или для совместимости с vim-plug
vim.cmd([[
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'preservim/vim-markdown'
Plug 'numToStr/Comment.nvim'
call plug#end()
]])


vim.cmd("syntax enable")        -- Включение подсветки синтаксиса
vim.cmd("set background=dark") -- Или 'light', если нужно
vim.cmd("colorscheme gruvbox") -- Применить Gruvbox


-- Настройка nvim-cmp
local cmp = require'cmp'

cmp.setup({
  sources = {
    { name = 'buffer' }, -- Предлагает завершение из текущего буфера
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Перебор вниз
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Перебор вверх
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Выбор завершения
  },
})
