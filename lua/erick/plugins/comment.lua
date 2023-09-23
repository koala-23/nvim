return {
    "numToStr/Comment.nvim",
    keys = {
        { "gcc", desc = "Comment current line" },
        { "gc",  mode = "v",                         desc = "Comment selected text" },
        { "gco", desc = "Inser comment to next line" }
    },
    config = function()
        require('Comment').setup {
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        }
    end
}
