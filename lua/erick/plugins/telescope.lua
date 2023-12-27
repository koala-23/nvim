local opts = { noremap = true, silent = true }

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("telescope").load_extension "notify"
        require("telescope").load_extension "file_browser"
        require("telescope").load_extension "ui-select"
        require("telescope").load_extension "fzf"

        require("telescope").setup {
            defaults = {
                initial_mode = "insert",
                file_ignore_patterns = { "%.zip", "lazy-lock.json", "node_modules/", "live-server/", "vendor/" },
                prompt_prefix = "  ",
                selection_caret = "󱞩 ",
                winblend = 0,
                layout_strategy = "vertical",
                layout_config = {
                    width = 0.6,
                    height = 0.85,
                    preview_cutoff = 1,
                    mirror = true,
                    prompt_position = "top",
                },
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                scroll_strategy = "limit",
                color_devicons = true,
                mappings = {
                    n = {
                        ["<C-c>"] = "close",
                        ["<C-h>"] = "which_key",
                    },
                    i = {
                        ["<C-c>"] = "close",
                    },
                },
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                history = {
                    path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
                    limit = 100,
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        borderchars = {
                            prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                            results = { "─", "│", "─", "│", "╭", "╮", "┤", "├" },
                            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                        },
                        width = 0.8,
                        previewer = false,
                    },
                },
            },
        }
    end,
    keys = {
        { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Grep string", opts },
        { "<leader>fw", "<cmd>Telescope live_grep<cr>",   desc = "Live grep",   opts },
        { "<leader>gs", "<cmd>Telescope git_status<cr>",  desc = "Git Status",  opts },
        { "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Git commits", opts },
        {
            "<leader>ff",
            function()
                local opt = { show_untracked = true }
                local ok = pcall(require("telescope.builtin").git_files, opt)
                if not ok then
                    require("telescope.builtin").find_files(opt)
                end
            end,
            desc = "Git/Find files",
            opts,
        },
        {
            "<leader>fh",
            function()
                return require("telescope.builtin").find_files {
                    prompt_title = " Hidden Files",
                    hidden = true,
                    file_ignore_patterns = {},
                }
            end,
            desc = "Find hidden files",
            opts,
        },
        {
            "<leader>fp",
            function()
                return require("telescope").extensions.file_browser.file_browser {
                    cwd = "~/.config/nvim-2/lua/erick/plugins",
                    prompt_title = " Neovim Config ",
                }
            end,
            desc = "Open neovim config",
            opts,
        },
        {
            "<leader>fb",
            function()
                return require("telescope").extensions.file_browser.file_browser {
                    path = "%:p:h",
                    select_buffer = true,
                    file_ignore_patterns = {},
                }
            end,
            desc = "File browser relative",
            opts,
        },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>",                          desc = "Keymaps",   opts },
        { "<leader>fa", "<cmd>Telescope help_tags<cr>",                        desc = "Help tags", opts },
        { "<leader>fn", "<cmd>Telescope todo-comments keywords=TODO,NOTE<cr>", desc = "Todos",     opts },
        { "<leader>fx", "<cmd>Telescope todo-comments keywords=FIX,BUG<cr>",   desc = "Todo Fix",  opts },
    },
}
