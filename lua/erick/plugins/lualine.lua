-- ---@diagnostic disable: undefined-field
-- local function lsp_client()
--    local clients = vim.lsp.get_clients()
--    local client_names = {}
--    for _, client in ipairs(clients) do
--       table.insert(client_names, "  " .. client.name)
--    end
--
--    return #client_names > 0 and table.concat(client_names, " ") or 'No Active LSP'
-- end

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            globalstatus = true,
        },
        extensions = { "fugitive" },
        sections = {
            lualine_a = { { "mode", upper = true } },
            lualine_b = { { "branch", icon = "" }, "db_ui#statusline" },
            lualine_c = { { "filename", file_status = false, path = 0 } },
            lualine_x = {
                "diagnostics",
                {
                    "diff",
                    symbols = {
                        added = " ", modified = " ", removed = " "
                    }
                },
            },
            lualine_y = { "filetype", "progress" },
            lualine_z = { "location" },
        },
        inactive_winbar = {
            lualine_c = { "filename" },
        },
    },
}
