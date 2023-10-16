-- modifica el color de fondo del menu de completacion
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#24273a" })
-- modifica el color de fondo del submenu de documentacion
vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = "#24273a" })
-- modifica el color del cursor line
vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#393c4d" })

return {
   "hrsh7th/nvim-cmp",
   dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-git",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
      { "L3MON4D3/LuaSnip", version = "v2.*" },
   },
   event = { "BufReadPre", "BufNewFile" },
   config = function()
      require("luasnip.loaders.from_vscode").load({ paths = { "./my-snippets" } })

      local cmp = require("cmp")

      local luasnip = require("luasnip")

      local lspkind = require("lspkind")

      local compare = require "cmp.config.compare"

      cmp.setup({
         completion = {
            completeopt = "menu, menuone, noselect",
         },
         snippet = {
            expand = function(args)
               luasnip.lsp_expand(args.body)
            end,
         },
         mapping = {
            -- ["<Tab>"] = cmp.mapping(function(fallback)
            --     if cmp.visible() then
            --         cmp.select_next_item()
            --     elseif luasnip.choice_active() then
            --         luasnip.change_choice(1)
            --     else
            --         fallback()
            --     end
            -- end, { "i", "s" }),
            ['<Tab>'] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_next_item()
               elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
               else
                  fallback()
               end
            end, { 'i', 's' }),
            ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<C-k>'] = cmp.mapping.scroll_docs(-4),
            ['<C-j>'] = cmp.mapping.scroll_docs(4),
            ['<C-space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({
               behavior = cmp.ConfirmBehavior.Replace,
               select = false
            })
         },
         -- sources for autocompletion
         sources = cmp.config.sources({
            { name = 'path' },
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'luasnip' },
            { name = "codeium" },
            { name = 'buffer',  keyword_length = 5 },
         }),
         formatting = {
            format = lspkind.cmp_format({
               mode = "symbol_text",
               menu = ({
                  path = "[PATH]",
                  nvim_lsp = "[LSP]",
                  nvim_lua = "[API]",
                  buffer = "[BUFFER]",
                  luasnip = "[SNIP]",
                  codeium = '["]',
                  ["vim-dadbod-completion"] = "[󰪩]",
               })
            }),
         },
         view = {
            entries = { name = 'custom' }
         },
         window = {
            completion = {
               border = "rounded",
               winhighlight = "Normal:CmpNormal,CursorLine:MyCursorLine",
            },
            documentation = {
               border = "rounded",
               winhighlight = "Normal:CmpDocNormal",
            }
         },
         sorting = {
            priority_weight = 2,
            comparators = {
               compare.offset,
               compare.exact,
               compare.score,
               compare.kind,
               compare.sort_text,
               compare.length,
               compare.order,
            }
         },
         experimental = {
            native_menu = false,

            ghost_text = false,
         },
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
         sources = cmp.config.sources({
            { name = 'git' },     -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
         }, {
            { name = 'buffer' },
         })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            { name = 'buffer' }
         }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
         mapping = cmp.mapping.preset.cmdline(),
         sources = cmp.config.sources({
            { name = 'path' }
         }, {
            { name = 'cmdline' }
         })
      })
   end,
}
