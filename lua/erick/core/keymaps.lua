vim.g.mapleader = " "
local map = vim.keymap.set

-- Splits
map("n", "<leader>Q", ":q!<CR>", { noremap = true, silent = true, desc = "Splits quit" })
map("n", "<C-q>", ":bd<CR>", { noremap = true, silent = true, desc = "Splits quit" })
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
map("n","<Tab>n", ":bnext<CR>", { noremap = true, silent = true, desc = "bnext" })
map("n","<Tab>p", ":bprev<CR>", { noremap = true, silent = true, desc = "bnext" })

-- indentar codigo
map({ "n", "v" }, '<A-F>', 'mm=G`m', { noremap = true, silent = true, desc = "Indent code without plugin" })

-- mover las lineas selecionadas arriba/abajo
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- borrar una palabra
map('n', 'dw', 'vb"_d', { noremap = true, silent = true })

-- para la busqueda
map("n", "n", "nzzzv", {})
map("n", "N", "Nzzzv", {})

map("n", "<Esc>", ":noh<return><esc>", { silent = true })
map("i", "<C-c>", "<Esc>", {})
map("n", "space", "<nop>", {})
map("n", "Q", "<nop>", {})
map("n", "q", "<nop>", {})
map("n", "J", "<nop>", {})
map("n", "L", "<nop>", {})
map("n", "H", "<nop>", {})
map("n", "<leader>e", "<cmd>Explore<cr>", { desc = "Explorer" })

-- borrado especial
map("v", "d", '"_d', { noremap = true, silent = true })
map("n", "dd", '"_dd', { noremap = true, silent = true })

--desplazamiento suave
map("n", "<C-u>", "6k", { noremap = true, silent = true })
map("n", "<C-d>", "6j", { noremap = true, silent = true })

-- agregar indentación al codigo
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- copiar al portapapeles
map("v","<leader>y", '"+y', { noremap = true, silent = true })

-- pegar desde el portapapeles
map("n","<leader>p", '"+p', { noremap = true, silent = true })

-- modifica el texto donde el cursor se encuentre
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
