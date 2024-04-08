return {
    "numToStr/Comment.nvim",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring"
    },
    config =function ()
        vim.keymap.set('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', {desc = "Comment Line"})
        vim.keymap.set('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', {desc = "Comment Selected"})
        local comment = require("Comment")

        local ts_context_comment_string = require("ts_context_commentstring.integrations.comment_nvim")

        comment.setup({
            pre_hook = ts_context_comment_string.create_pre_hook()
        })
    end
}
