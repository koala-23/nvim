return {
    "jwalton512/vim-blade",
    init = function()
        vim.g.blade_custom_directives = { 'datetime', 'javascript' }
        vim.g.blade_custom_directives_pairs = {
            ['markdown'] = 'endmarkdown',
            ['cache'] = 'endcache',
        }
    end,
    ft = { "blade", "php", "blade.php" },
}
