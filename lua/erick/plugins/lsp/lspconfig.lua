return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local map = vim.keymap.set

        local opts = { noremap = true, silent = true }

        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show LSP references"
            map("n", "<leader>vr", "<cmd>Telescope lsp_references<CR>", opts)

            opts.desc = "Show LSP definitions"
            map("n", "gd", vim.lsp.buf.definition, opts)

            opts.desc = "See available code actions"
            map({ "n", "v" }, "<leader>vc", vim.lsp.buf.code_action, opts)

            opts.desc = "Smart rename"
            map("n", "<A-r>", vim.lsp.buf.rename, opts)

            opts.desc = "Format code"
            map("n", "<A-f>", vim.lsp.buf.format, opts)

            opts.desc = "Show buffer diagnostics"
            map("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

            opts.desc = "Show line diagnostics"
            map("n", "<leader>vd", vim.diagnostic.open_float, opts)

            opts.desc = "Go to previous diagnostic"
            map("n", "[d", vim.diagnostic.goto_prev, opts)

            opts.desc = "Go to next diagnostic"
            map("n", "]d", vim.diagnostic.goto_next, opts)

            opts.desc = "Show documentation for what is under cursor"
            map("n", "K", vim.lsp.buf.hover, opts)

            vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint(bufnr, true)
            end
        end

        vim.diagnostic.config { virtual_text = false }

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescript", "javascript", "php", "blade" },
        })

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
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

        lspconfig["phpactor"].setup({
            on_attach = on_attach,
            filetypes = { "php", "blade" },
            init_options = {
                ["language_server_worse_reflection.inlay_hints.enable"] = true,
                ["language_server_worse_reflection.inlay_hints.params"] = true,
                ["code_transform.import_globals"] = true,
                ["language_server_phpstan.enabled"] = true,
                -- ["language_server_worse_reflection.inlay_hints.types"] = true,
                ["language_server_configuration.auto_config"] = false,
                ["language_server_phpstan.level"] = 7,
            },
            handlers = {
                ["textDocument/inlayHint"] = function(err, result, ...)
                    for _, res in ipairs(result) do
                        res.label = res.label .. ": "
                    end
                    vim.lsp.handlers["textDocument/inlayHint"](err, result, ...)
                end,
            },
        })

        local servers = {
            "cssls",
            "html",
            "vimls",
            "lemminx",
            "tsserver",
            "marksman",
            "tailwindcss",
        }
        for _, server in pairs(servers) do
            lspconfig[server].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end
    end,
}
