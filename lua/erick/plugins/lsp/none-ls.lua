return {
   "nvimtools/none-ls.nvim",
   event = { "BufReadPre", "BufNewFile" },
   config = function()
      local null_ls = require("null-ls")

      local null_ls_utils = require("null-ls.utils")

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      -- to setup format on save
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
         -- add package.json as identifier for root (for typescript monorepos)
         root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json", ".eslintrc"),
         sources = {
            null_ls.builtins.code_actions.refactoring,
            -- FORMATT
            formatting.prettier.with({ extra_args = { config_file = "~/.prettierrc.json" } }),
            formatting.phpcbf.with({ extra_args = { "--standard=PSR12" } }),

            -- DIAGNOSTICS
            diagnostics.phpcs.with({ extra_args = { "--standard=~/php/phpcs/phpcs.xml" } }),
            diagnostics.stylelint.with({ extra_args = { config_file = "~/.stylelintrc.json" } }),
            diagnostics.eslint_d.with({
               condition = function(utils)
                  return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
               end,
            }),
         },

         -- configure format on save
         on_attach = function(current_client, bufnr)
            if current_client.supports_method("textDocument/formatting") then
               vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
               vim.api.nvim_create_autocmd("BufWritePre", {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                     vim.lsp.buf.format({
                        filter = function(client)
                           --  only use null-ls for formatting instead of lsp server
                           return client.name == "null-ls"
                        end,
                        bufnr = bufnr,
                     })
                  end,
               })
            end
         end,
      })
   end,
}
