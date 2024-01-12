return {
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    cond = not vim.g.vscode,
    version = false,
    config = true,
  },
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    cond = not vim.g.vscode,
    version = false,
    config = true,
  },
  {
    'echasnovski/mini.surround',
    -- sa Add surrounding in Normal and Visual modes
    -- sd Delete surrounding
    -- sf Find surrounding (to the right)
    -- sF Find surrounding (to the left)
    -- sh Highlight surrounding
    -- sr replace surrounding
    -- sn Update `n_lines`
    event = 'VeryLazy',
    cond = not vim.g.vscode,
    version = false,
    config = true,
  },
  {
    'echasnovski/mini.ai',
    event = 'VeryLazy',
    cond = not vim.g.vscode,
    version = false,
    config = function()
      local ai = require 'mini.ai'
      local opts = {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { '@block.outer', '@conditional.outer', '@loop.outer' },
            i = { '@block.inner', '@conditional.inner', '@loop.inner' },
          }, {}),
          f = ai.gen_spec.treesitter(
            { a = '@function.outer', i = '@function.inner' },
            {}
          ),
          c = ai.gen_spec.treesitter(
            { a = '@class.outer', i = '@class.inner' },
            {}
          ),
          t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' },
        },
      }
      ai.setup(opts)
    end,
  },
}
