return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})

            vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {desc="Git Preview Changes"})
        end
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", {desc="Git Blame"})
            vim.keymap.set("n", "<leader>gA", ":Git add .<cr>", {desc = "Git Add All"})
            vim.keymap.set("n", "<leader>ga", "Git add", {desc = "Git Add"})
            vim.keymap.set("n", "<leader>gc", ":Git commit", {desc = "Git Commit"})
            vim.keymap.set("n", "<leader>gp", "Git push", {desc = "Git Push"})
        end
    }
}
