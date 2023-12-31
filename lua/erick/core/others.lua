-- quitar autocomentado en la siguiente linea
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Disable the concealing in some file formats
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
    pattern = "*",
    command = "set nopaste",
})

vim.diagnostic.config {
    virtual_text = true,
    float = {
        border = "single"
    },
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'single' }
)

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function()
        vim.cmd [[%s/\s\+$//e]]
    end,
})

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
