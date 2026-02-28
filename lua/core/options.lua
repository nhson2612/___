-- ===============================
-- Core Options
-- ===============================

local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false
opt.cmdheight = 1
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Indent & Tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300
opt.lazyredraw = true

-- Split
opt.splitright = true
opt.splitbelow = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Backup
opt.swapfile = false
opt.backup = false
opt.undofile = true

vim.o.updatetime = 250
