return {
    "williamboman/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "Mason",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        -- import mason-null-ls
        local mason_null_ls = require("mason-null-ls")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "tsserver",
                "html",
                "cssls",
                "yamlls",
                "tailwindcss",
                "lua_ls",
                "emmet_ls",
                "marksman",
                "jsonls",
                "phpactor",
                "lemminx",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        mason_null_ls.setup({
            -- list of formatters & linters for mason to install
            ensure_installed = {
                "prettier",
                "luacheck", -- ts/js formatter
                "blade_formatter",
                "stylua",   -- lua formatter
                "eslint_d", -- ts/js linter
                "pint",
                "php-debug-adapter"
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true,
        })
    end,
}
