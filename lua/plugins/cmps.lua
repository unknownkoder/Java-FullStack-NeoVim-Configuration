return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        depedencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                completion = {
                    competeopt = "menu,menuone,preview,noselect"
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    -- previous suggestion
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    -- next suggestion
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    -- show completion suggestions
                    ["<C-Space"] = cmp.mapping.complete(),
                    -- close completion window
                    ["<C-e>"] = cmp.mapping.abort(),
                    -- confirm completion, only when you explicitly selected an option
                    ["<CR>"] = cmp.mapping.confirm({ select = false})
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' }
                })

            })
        end,
    },
}
