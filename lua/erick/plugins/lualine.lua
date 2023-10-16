local function lsp_client()
    local clients = vim.lsp.get_clients()
    local client_names = {}
    for _, client in ipairs(clients) do
        table.insert(client_names, "  " .. client.name)
    end

    return #client_names > 0 and table.concat(client_names, " ") or 'No Active LSP'
end

return {
    "nvim-lualine/lualine.nvim",
    dependencie = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                icons_enabled = true,
                globalstatus = true,
            },
            extensions = { "quickfix", "fugitive" },
            sections = {
                lualine_a = { { "mode", upper = true } },
                lualine_b = { { "branch", icon = "" }, "db_ui#statusline" },
                lualine_c = { { "filename", file_status = false, path = 1 } },
                lualine_x = {
                    "diagnostics",
                    "diff",
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_y = { "filetype", lsp_client, "progress" },
                lualine_z = { "location" },
            },
            winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename"},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            inactive_winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename"},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
