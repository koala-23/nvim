return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
        "nvim-treesitter/nvim-treesitter-textobjects",
        { "windwp/nvim-ts-autotag", config = true },
    },
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "css",
            "html",
            "http",
            "javascript",
            "json",
            "lua",
            "luadoc",
            "markdown",
            "php",
            "scss",
            "sql",
            "bash",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "toml",
            "vue",
            "java",
            "yaml"
        },
        autotag = {
            enable = true,
            enable_rename = true,
            enable_close = true,
            enable_close_on_slash = true,
            filetypes = { "html", "xml", "javascript", "typescript", "php", "blade", "vue" },
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "org" },
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>+",
                node_decremental = "<C-space>-",
                scope_incremental = "<C-space>c"
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["aC"] = "@class.outer",
                    ["iC"] = "@class.inner",
                    ["ac"] = "@conditional.outer",
                    ["ic"] = "@conditional.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                },
            },
        },
        context_commentstring = {
            enable_autocmd = false,
        },
    }
}
