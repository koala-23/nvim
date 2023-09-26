return {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    -- stylua: ignore
    keys = {
        { "]t",         function() require("todo-comments").jump_next() end, desc = "Next ToDo comment" },
        { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous ToDo comment" },
        { "<leader>ft", "<cmd>TodoTelescope<cr>",                            desc = "ToDo" },
        -- { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
    },
}
