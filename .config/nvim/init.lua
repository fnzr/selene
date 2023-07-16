vim.g.mapleader = " "
vim.keymap.set('v', '<C-c>', '"+y')
require("set")
require("keymap")


vim.api.nvim_create_autocmd({"InsertLeave"}, {
    callback = function()
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#16112e" })
    end
})

vim.api.nvim_create_autocmd({"InsertEnter"}, {
    callback = function()
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#25213b" })
    end
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup("plugins")

