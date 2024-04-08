return { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>/'] = {name = "Comments", _ = 'which_key_ignore'},
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = {name = '[D]ebug' , _ = 'which_key_ignore' },
        ['<leader>e'] = {name = '[E]xplorer', _ = 'which_key_ignore'},
        ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>J'] = { name = '[J]ava', _ = 'which_key_ignore' },
        ['<leader>w'] = {name = '[W]indow', _ = 'which_key_ignore'}
      }
    end,
}
