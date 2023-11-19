return {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        highlight = {
            keyword = "fg",
        }
    },
    keys = {
        { "]t",         function() require("todo-comments").jump_next() end, desc = "Next ToDo comment" },
        { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous ToDo comment" },
        -- { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
    },
}
