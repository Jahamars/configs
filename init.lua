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


-- Умные отступы
vim.opt.autoindent = true -- Автоматическое копирование отступов с предыдущей строки
vim.opt.smartindent = true -- Смарт-отступы для структурированного кода
vim.opt.expandtab = true -- Преобразование табов в пробелы
vim.opt.shiftwidth = 4 -- Количество пробелов для уровня отступа
vim.opt.tabstop = 4 -- Количество пробелов, которое представляет таб
vim.opt.softtabstop = 4 -- Количество пробелов при нажатии Tab
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = true -- Специфичные отступы для C/C++ и подобных языко


-- Маппинги для нормального режима
vim.api.nvim_set_keymap('n', '<A-d>', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-q>', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':wq<CR>', { noremap = true, silent = true })
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
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mg979/vim-visual-multi'
Plug 'neovim/nvim-lspconfig' " LSP для настройки clangd
Plug 'hrsh7th/cmp-nvim-lsp'  " Источник для LSP
Plug 'hrsh7th/cmp-path'      " Источник для путей
Plug 'nvim-lualine/lualine.nvim'
"Plug 'norcalli/nvim-colorizer.lua'
"Plug 'sindrets/diffview.nvim'
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
call plug#end()
]])
--Plug 'L3MON4D3/LuaSnip'      " Сниппеты

vim.cmd("syntax enable")        -- Включение подсветки синтаксиса
vim.cmd("set background=dark") -- Или 'light', если нужно
vim.cmd("colorscheme gruvbox") -- Применить Gruvbox




-- Визуальный режим: Tab для сдвига вправо
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
-- Визуальный режим: Shift-Tab для сдвига влево
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })



vim.keymap.set('n', 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'dd', '"_dd', { noremap = true })
vim.keymap.set('x', 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'x', '"_x', { noremap = true })

-- custom start page 
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if #vim.fn.argv() == 0 then -- Проверка, что Neovim открыт без аргументов
      vim.cmd([[
        enew
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal nobuflisted
        setlocal nonumber norelativenumber
        setlocal noswapfile
      ]])

      -- Добавляем текст на стартовую страницу
      local lines = {
      	"", 
      	"", 
      	"", 
      	"", 
      	"", 
      	"", 
      	"", 
        "				   •  •     ┓•    ",
        "				┏┳┓┓┏┓┓┏┳┓┏┓┃┓┏┏┳┓",
        "				┛┗┗┗┛┗┗┛┗┗┗┻┗┗┛┛┗┗",
        "",
	    "				[e] New File ",
        "  				[f] Search ",
        "  				[r] Recent files",
        "  				[q] Quit ",
      }
      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

      vim.api.nvim_buf_set_keymap(0, "n", "e", ":ene <BAR> startinsert<CR>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, "n", "f", ":Telescope find_files<CR>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, "n", "q", ":qa<CR>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, "n", "r", ":Telescope oldfiles<CR>", { noremap = true, silent = true })
    end
  end,
})


--  lsp config
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

local cmp = require'cmp'
cmp.setup({
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup {
  capabilities = capabilities,
}

vim.opt.pumheight = 10  -- Установить максимальную высоту всплывающего меню
vim.opt.pumwidth = 50  -- Установить максимальную ширину всплывающего меню
vim.opt.pumblend = 10  -- Сделать меню полупрозрачным для лучшего восприятия

local nvim_lsp = require('lspconfig')

nvim_lsp.pylsp.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = true, ignore = {'W391'}, maxLineLength = 88 },
        pyflakes = { enabled = true },
        pylint = { enabled = false },
        yapf = { enabled = false },
      },
    },
  },
})




-- -- go to last change line at the start 
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   pattern = "*",
--   callback = function()
--     if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
--       vim.cmd("normal! g`\"")
--     end
--   end,
-- })



-- manping to with mowing
vim.api.nvim_set_keymap('n', '<A-Up>', ':m .-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-Down>', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('x', '<A-Up>', ":m '<-2<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('x', '<A-Down>', ":m '>+1<CR>gv=gv", { noremap = true })

-- Визуальный режим: Tab для сдвига вправо
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
-- Визуальный режим: Shift-Tab для сдвига влево
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })


-- -- colorizer 
-- require'colorizer'.setup({
--   '*', -- Подключить для всех файлов
--   css = { rgb_fn = true }, -- Включить поддержку rgb() в CSS
-- }, { mode = 'background' })


-- Добавить новую строку ниже при Alt+O
vim.api.nvim_set_keymap('n', '<A-o>', 'o<Esc>', { noremap = true, silent = true })
-- Добавить новую строку выше при Alt+Shift+O
vim.api.nvim_set_keymap('n', '<A-O>', 'O<Esc>', { noremap = true, silent = true })

-- go to last change with A-l
vim.api.nvim_set_keymap('n', '<A-l>', '`.', { noremap = true, silent = true })


-- rounded lualine 
require('lualine').setup {
  options = {
    theme = 'gruvbox', -- Выбор темы
    component_separators = { left = '', right = '' }, -- Мягкие округлённые разделители компонентов
    section_separators = { left = '', right = '' },
    globalstatus = true, -- Для единой строки состояния в Neovim
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '', right = '' }, right_padding = 2 } },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { { 'location', separator = { left = '', right = '' }, left_padding = 2 } },
  },
}


-- noice notyfy settings 
require("noice").setup({
  cmdline = {
    enabled = true, -- Включить кастомную командную строку
    view = "cmdline", -- Вид для строки команд
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { pattern = "^/", icon = " ", lang = "regex" },
      search_up = { pattern = "^%?", icon = " ", lang = "regex" },
    },
  },
  messages = {
    enabled = true, -- Показывать всплывающие уведомления
  },
    -- size = {
    --     width = 40, -- Ширина окна
    --     height = "auto", -- Автоматическая высота
    --   },
    --   border = {
    --     style = "rounded", -- Закруглённые границы
    --     padding = { 0, 1 }, -- Внутренний отступ
    --   },
    --   win_options = {
    --     winblend = 10, -- Прозрачность окна
    --     winhighlight = "Normal:Normal,FloatBorder:FloatBorder", -- Подсветка
    --   },
  popupmenu = {
    enabled = true, -- Включить всплывающие меню для автодополнения
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true, -- Перенос строки поиска вниз
    command_palette = true, -- Командная палитра
    long_message_to_split = true, -- Длинные сообщения в окно сплита
    inc_rename = false, -- Инкрементальное переименование (опционально)
    lsp_doc_border = true, -- Границы для документации LSP
  },
})


-- hiding comandline
vim.opt.cmdheight = 0
