---@diagnostic disable: undefined-field
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

require("lazy").setup({ { import = "erick.plugins" }, { import = "erick.plugins.lsp" } }, {
   default = {
      lazy = true
   },
   ui = { border = "rounded" },
   checker = {
      enabled = true,
      notify = false,
      frequency = 43200,
   },
   change_detection = {
      notify = false,
   },
   performance = {
      rtp = {
         disabled_plugins = {
            "gzip",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
         },
      },
   },
})
