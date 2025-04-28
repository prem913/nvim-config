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
vim.keymap.set("n", "<leader>vv", "<cmd>e ~/.config/nvim/init.lua")

local save_and_build_java_project = function()
  vim.api.nvim_command("silent wa")
  vim.api.nvim_command("silent !mvn package > ~/.lastmvnbuild.log")
end

vim.api.nvim_create_user_command("Was", save_and_build_java_project, {})

local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
vim.opt.conceallevel = 2
vim.opt.inccommand = 'split'

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.foldenable = false
  end,
})


-- -- To remove the annoying ^M due to windows
-- function Trim()
--     local save = vim.fn.winsaveview()
--     vim.cmd("keeppatterns %s/\\s\\+$\\|\\r$//e")
--     vim.fn.winrestview(save)
-- end
--
-- function Paste_and_trim()
-- -- Perform the default paste action
-- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('p', true, false, true), 'n', false)
-- -- Call the trim function
-- vim.schedule(function()
-- Trim()
-- end)
-- end

require("vim-options")
require("lazy").setup("plugins")
