return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        -- ts-autotag utilizes treesitter to understand the code structure to automatically close tsx tags
        "windwp/nvim-ts-autotag"
    },
    -- when the plugin builds run the TSUpdate command to ensure all our servers are installed and updated
    build = ':TSUpdate',
    config = function()
        -- gain access to the treesitter config functions
        local ts_config = require("nvim-treesitter.configs")

        -- call the treesitter setup function with properties to configure our experience
        ts_config.setup({
            -- make sure we have vim, vimdoc, lua, java, javascript, typescript, html, css, json, tsx, markdown, markdown, inline markdown and gitignore highlighting servers
            ensure_installed = {"vim", "vimdoc", "lua", "java", "javascript", "typescript", "html", "css", "json", "tsx", "markdown", "markdown_inline", "gitignore"},
            -- make sure highlighting it anabled
            highlight = {enable = true},
            -- enable tsx auto closing tag creation
            autotag = {
                enable = true
            }
        })
    end
}
