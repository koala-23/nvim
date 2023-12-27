return {
    "rest-nvim/rest.nvim",
    ft = "http",
    tag = "v1.2.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local rest_nvim = require "rest-nvim"

        rest_nvim.setup {
            -- Open request results in a horizontal split
            result_split_horizontal = false,
            -- Skip SSL verification, useful for unknown certificates
            skip_ssl_verification = false,
            encode_url = false,
            -- Highlight request on run
            highlight = {
                enabled = true,
                timeout = 150,
            },
            result = {
                -- toggle showing URL, HTTP info, headers at top the of result window
                show_url = true,
                show_http_info = true,
                show_headers = false,
                formatters = {
                    json = "jq"
                }
            },
            -- Jump to request line on run
            jump_to_request = false,
            env_file = ".env",
            custom_dynamic_variables = {},
            yank_dry_run = true,
        }
        vim.keymap.set("n", "<leader>ht", "<Plug>RestNvim<cr>", { noremap = true, silent = true, desc = "Rest Nvim" })
    end
}
