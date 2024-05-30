return {
  {
    'nvim-telescope/telescope.nvim',
    cond = not vim.g.vscode,
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = jit.os == 'OSX' and 'make'
          or 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      },
      {
        'princejoogie/dir-telescope.nvim',
        config = function()
          require('dir-telescope').setup {
            hidden = true,
            no_ignore = false,
            show_preview = true,
          }
        end,
      },
    },
    keys = {
      {
        -- show all buffers
        '<leader><space>',
        "<CMD>lua require('telescope.builtin').buffers({ sort_mru = true })<CR>",
      },
      {
        -- find file in all files
        '<leader>f',
        "<CMD>lua require('telescope.builtin').find_files()<CR>",
      },
      {
        -- find file in all files
        '<C-p>',
        "<CMD>lua require('telescope.builtin').find_files()<CR>",
      },
      {
        -- find text in all files
        '<leader>g',
        "<CMD>lua require('telescope.builtin').live_grep()<CR>",
      },
      { '<leader>?', "<CMD>lua require('telescope.builtin').oldfiles()<CR>" },
      {
        -- find text in directories
        '<leader>dg',
        "<CMD>lua require('telescope').extensions.dir.live_grep()<CR>",
      },
      {
        -- find file in directories
        '<leader>df',
        "<CMD>lua require('telescope').extensions.dir.find_files()<CR>",
      },
    },
    config = function()
      local actions = require 'telescope.actions'
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['esc'] = actions.close,
            },
          },
          dynamic_preview_title = true,
          path_display = { 'smart' },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
      }
      require('telescope').load_extension 'fzf'
      require('telescope').load_extension 'dir'
    end,
  },
}
