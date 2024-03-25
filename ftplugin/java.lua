local home = os.getenv 'HOME'
local workspace_path = home .. '/.local/share/nvim/jdtls-workspace/'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = workspace_path .. project_name

local status, jdtls = pcall(require, 'jdtls')
if not status then
    return
end
local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. home .. '/.local/share/nvim-2/mason/packages/jdtls/lombok.jar',
        '-jar',
        vim.fn.glob(home .. '/.local/share/nvim-2/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration',
        home .. '/.local/share/nvim-2/mason/packages/jdtls/config_linux',
        '-data',
        workspace_dir,
    },
    root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' },

    settings = {
        java = {
            signatureHelp = { enabled = true },
            extendedClientCapabilities = extendedClientCapabilities,
            maven = {
                downloadSources = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = 'all', -- literals, all, none
                },
            },
            format = {
                enabled = true,
            },
        },
    },

    init_options = {
        bundles = {},
    },
}

local lsp_flags = { debounce_text_changes = 150 }

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local opts = { noremap = true, silent = true }

local on_attach = function(_, bufnr)
    opts.buffer = bufnr

    opts.desc = "Show LSP references"
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

    opts.desc = "Show LSP definitions"
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Show LSP implementation"
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

    opts.desc = "See available code actions"
    vim.keymap.set({ "n", "v" }, "<leader>vc", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Format code"
    vim.keymap.set("n", "<A-f>", vim.lsp.buf.format, opts)

    opts.desc = "Show line diagnostics"
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

    opts.desc = "Show documentation for what is under cursor"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
end

config.on_attach = on_attach;
config.flags = lsp_flags;
config.capabilities = capabilities;
require('jdtls').start_or_attach(config)

vim.keymap.set('n', '<leader>co', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = 'Organize Imports' })
vim.keymap.set('n', '<leader>crv', "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = 'Extract Variable' })
vim.keymap.set('v', '<leader>crv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
    { desc = 'Extract Variable' })
vim.keymap.set('n', '<leader>crc', "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = 'Extract Constant' })
vim.keymap.set('v', '<leader>crc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
    { desc = 'Extract Constant' })
vim.keymap.set('v', '<leader>crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = 'Extract Method' })
