require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,
        disable = {},
    },
    ensure_installed = {
       "tsx",
       "json",
       "yaml",
       "html",
       "scss",
       "lua",
       "css",
       "javascript",
       "vue",
       "go",
       "graphql"
    },
    rainbow = {
        enable = true,
    }
}
