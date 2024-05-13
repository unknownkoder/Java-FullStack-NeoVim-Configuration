return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            -- feed luasnip suggestions to cmp
            "saadparwaiz1/cmp_luasnip",
            -- provide vscode like snippets to cmp
            "rafamadriz/friendly-snippets",
        }
    },
    -- cmp-nvim-lsp provides language specific completion suggestions to nvim-cmp
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    -- nvim-cmp provides auto completion and auto completion dropdown ui
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- buffer based completion options
            "hrsh7th/cmp-buffer",
            -- path based completion options
            "hrsh7th/cmp-path",
        },
        config = function()
            -- Gain access to the functions of the cmp plugin
            local cmp = require("cmp")
            -- Gain access to the function of the luasnip plugin
            local luasnip = require("luasnip")

            -- Lazily load the vscode like snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- All the cmp setup function to configure our completion experience
            cmp.setup({
                -- How should completion options be displayed to us?
                completion = {
                    -- menu: display options in a menu
                    -- menuone: automatically select the first option of the menu
                    -- preview: automatically display the completion candiate as you navigate the menu
                    -- noselect: prevent neovim from automatically selecting a completion option while navigating the menu
                    competeopt = "menu,menuone,preview,noselect"
                },
                -- setup snippet support based on the active lsp and the current text of the file
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                -- setup how we interact with completion menus and options
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
                -- Where and how should cmp rank and find completions
                -- Order matters, cmp will provide lsp suggestions above all else
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' }
                })
            })
        end
    }
}
