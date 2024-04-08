return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "windwp/nvim-ts-autotag"
    },
    build = ':TSUpdate',
    config = function()
        local ts_config = require("nvim-treesitter.configs")
        ts_config.setup({
            ensure_installed = {"vim", "vimdoc", "lua", "javascript", "typescript", "html", "java", "css", "json", "tsx", "markdown", "markdown_inline", "gitignore"},
            highlight = {enable = true},
            indent = {enable = true},
            autotag = {
                enable = true
            }
        })
    end
} 
