return {
    "aurum77/live-server.nvim",
    run = function()
        require("live_server.util").install()
    end,
    cmd = { "LiveServerStart", "LiveServerStop", },
    config = function()
        local status_ok, live_server = pcall(require, "live_server")
        if not status_ok then
            return
        end

        live_server.setup({
            port = 8090,
            browser_command = "brave",
            quiet = false,
            no_css_inject = false, -- Disables css injection if true, might be useful when testing out tailwindcss
            install_path = vim.fn.stdpath "config" .. "/lua/erick/live-server/",
        })
    end,
    keys = {
        {"<leader><leader>l","<cmd>LiveServerStart<cr>", desc = "Start Live Server"},
    }
}
