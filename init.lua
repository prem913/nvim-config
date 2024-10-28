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

vim.opt.hlsearch = true

--eys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set("n","<leader>vv","<cmd>e ~/.config/nvim/init.lua")

local save_and_build_java_project = function()
  vim.api.nvim_command("silent wa")
  vim.api.nvim_command("silent !mvn package > ~/.lastmvnbuild.log")
end

vim.api.nvim_create_user_command("Was",save_and_build_java_project,{})


require("vim-options")
require("lazy").setup("plugins")
