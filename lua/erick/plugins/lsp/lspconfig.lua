return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        require("neodev").setup()

        local lspconfig = require("lspconfig")

        local lsp_flags = { debounce_text_changes = 150 }

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local map = vim.keymap.set

        local opts = { noremap = true, silent = true }

        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show LSP references"
            map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

            opts.desc = "Show LSP definitions"
            map("n", "gd", vim.lsp.buf.definition, opts)

            opts.desc = "See available code actions"
            map({ "n", "v" }, "<leader>vc", vim.lsp.buf.code_action, opts)

            opts.desc = "Smart rename"
            map("n", "<leader>rn", vim.lsp.buf.rename, opts)

            opts.desc = "Format code"
            map("n", "<A-f>", vim.lsp.buf.format, opts)

            opts.desc = "Show line diagnostics"
            map("n", "<leader>vd", vim.diagnostic.open_float, opts)

            opts.desc = "Show documentation for what is under cursor"
            map("n", "K", vim.lsp.buf.hover, opts)

            vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
        end

        lspconfig["lua_ls"].setup({
            flags = lsp_flags,
            on_attach = on_attach,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                    hint = {
                        enable = false
                    },
                },
            },
        })

        local pattern = { "package.json", "tsconfig.json", "jsconfig.json", ".eslintrc.json", ".eslintrc.js", ".eslintrc.cjs" }
        lspconfig["eslint"].setup({
            flags = lsp_flags,
            root_dir = lspconfig.util.root_pattern(pattern),
            on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufReadPre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        })

        local servers = {
            "html",
            "cssls",
            "tsserver",
            "jdtls",
            "emmet_ls",
            "angularls",
            "phpactor",
            "volar",
            "tailwindcss",
            "astro",
            "jsonls",
        }

        for _, server in pairs(servers) do
            lspconfig[server].setup({
                flags = lsp_flags,
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end

        local server_inactivos = {
            "marksman",
            "lemminx",
        }

        for _, server in pairs(server_inactivos) do
            lspconfig[server].setup({
                flags = lsp_flags,
                on_attach = on_attach,
                autostart = false,
            })
        end
    end
}
