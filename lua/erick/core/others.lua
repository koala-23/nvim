-- quitar autocomentado en la siguiente linea
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd({ "FileType" }, {
   pattern = { "json", "jsonc", "markdown" },
   callback = function()
      vim.wo.conceallevel = 0
   end,
})

-- undercurl
vim.cmd [[let &t_Cs = "\e[4:3m"]]
vim.cmd [[let &t_Ce = "\e[4:0m"]]

--turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
   pattern = '*',
   command = "set nopaste"
})

local lsp_servers = {
         "bashls",
         "gopls",
         "jsonls",
         "lemminx",
         "marksman",
         "tailwindcss",
         "volar",
         "yamlls",
}

function select_lsp()
   vim.ui.select(lsp_servers, {
      prompt = 'Selecciona un LSP para activar',
   }, function(_, lsp)
      activarLSP(lsp)
   end)
end

function activarLSP(lsp)
   if lsp == "bashls" or lsp=="gopls" or lsp=="jsonls" or lsp=="lemminx" or lsp=="marksman" or lsp=="tailwindcss" or lsp=="volar" or lsp=="yamlls" then
      vim.cmd("LspStart" .. lsp)
   end
end

vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>lua select_lsp()<CR>', { noremap = true, silent = true })
