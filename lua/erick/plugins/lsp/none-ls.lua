return {
   "nvimtools/none-ls.nvim",
   event = { "BufReadPre", "BufNewFile" },
   config = function()
      local null_ls = require("null-ls")

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      -- to setup format on save

      null_ls.setup({
         sources = {
            null_ls.builtins.code_actions.refactoring,
            formatting.prettier,
            formatting.phpcbf,
            diagnostics.phpcs,
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
