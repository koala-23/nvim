return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
    config = function()
        local mason = require("mason")

        local mason_lspconfig = require("mason-lspconfig")

        local mason_null_ls = require("mason-null-ls")

        mason.setup({
            ui = {
                border = "rounded",
                width = 0.7,
                height = 0.7,
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
                "cssls",
                "emmet_ls",
                "html",
                "jsonls",
                "lua_ls",
                "phpactor",
                "tsserver",
                "tailwindcss",
                "volar",
                "jdtls",
                "angularls",
                "astro",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        mason_null_ls.setup({
            -- list of formatters & linters for mason to install
            ensure_installed = {
                "prettier",
                "stylelint",
                "eslint-lsp"
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true,
        })
    end,
}
