local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    change_detection = {
        notify = false
    },
    checker = {
        enabled = true,
        notify = false
    }
}

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("lazy").setup("plugins", opts)
