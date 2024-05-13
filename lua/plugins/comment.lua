return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- plugin to allow us to automatically comment tsx elements with the comment plugin
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- Set a vim motion to <Space> + / to comment the line under the cursor in normal mode
		vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment Line" })
		-- Set a vim motion to <Space> + / to comment all the lines selected in visual mode
		vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment Selected" })

		-- gain access to the comment plugins functions
		local comment = require("Comment")
		-- gain access to tsx commenting plugins functions
		local ts_context_comment_string = require("ts_context_commentstring.integrations.comment_nvim")

		-- setup the comment plugin to use ts_context_comment_string to check if we are attempting to comment out a tsx element
		-- if we are use ts_context_comment_string to comment it out
		comment.setup({
			pre_hook = ts_context_comment_string.create_pre_hook(),
		})
	end,
}
