vim.g.mapleader = " "
vim.g.snnipet = "luasnip"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_silent = 1
vim.g.netrw_fastbrowse = 0

local opt = vim.opt

opt.guicursor = "i:ver30,v:hor30"
opt.mouse = ""
opt.cursorline = false
opt.number = true
opt.relativenumber = true
opt.conceallevel = 3 -- nivel de ocultamiento de caracteres en las lineas
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.errorbells = false
opt.wrap = false -- wrap para la lineas
opt.swapfile = false
opt.undofile = true
opt.undodir = os.getenv "~/.cache/nvim/undodir" -- ubicacion de los archivos de deshacer
opt.hlsearch = false                            -- desactica el resatado en la busqueda
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.autowrite = true
opt.list = false
opt.laststatus = 3
opt.cmdheight = 1
opt.updatetime = 400
opt.signcolumn = "yes"
opt.colorcolumn = "120"
opt.equalalways = false
opt.shortmess:append "I"
opt.history = 1000
opt.backup = false      -- desactica el backup de archivos
opt.writebackup = false -- desactica el backup de archivos modificados desde nvim
opt.pumheight = 15      -- Maximo numero de entradas en un popup
-- Highlight bracket pairs
opt.showmatch = true
opt.matchtime = 10
