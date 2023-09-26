vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "gf", "gf", { noremap = true, silent = true, desc = "Go to file" })

-- Splits
map("n", "<A-q>", ":bd<CR>", { noremap = true, silent = true, desc = "Splits quit" })
map("n", "<A-v>", ":vnew +set\\ buftype=nofile<CR>", { noremap = true, silent = true, desc = "Splits vertical" })
map("n", "<A-s>", ":new +set\\ buftype=nofile<CR>", { noremap = true, silent = true, desc = "Splits horizontal" })

-- windows
map("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true, desc = "tabnew" })
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Change window left" })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Change window down" })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Change window up" })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Change window right" })
map("n", "<C-w>h", "<C-w>H", { noremap = true, silent = true, desc = "split move left" })
map("n", "<C-w>j", "<C-w>J", { noremap = true, silent = true, desc = "split move down" })
map("n", "<C-w>k", "<C-w>K", { noremap = true, silent = true, desc = "split move up" })
map("n", "<C-w>l", "<C-w>L", { noremap = true, silent = true, desc = "split move right" })

-- indentar codigo
map({ "n", "v" }, "<A-F>", "=G", { noremap = true, silent = true, desc = "Indent code without plugin" })

-- mover las lineas selecionadas arriba/abajo
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- borrar una palabra
map('n', 'dw', 'vb"_d', { noremap = true, silent = true })
map("n", "n", "nzzzv", {})
map("n", "N", "Nzzzv", {})

map("n", "<esc>", ":noh<return><esc>", { silent = true })
map({ "n", "v", "i", "s" }, "<C-c>", "<esc>", {})
map({ "n", "v" }, "q", "<nop>", {})
map({ "n", "v" }, "space", "<nop>", {})
map("n", "<leader>e", "<cmd>Texplore<cr>", { desc = "Explorer" })
map("n", "<C-s>", "<cmd>w<cr>", { noremap = true, silent = true})

-- borrado especial 
map("v", "d", '"_d', { noremap = true, silent = true })
map("n", "dd", '"_dd', { noremap = true, silent = true })

-- quitar autocomentado en la siguiente linea
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]