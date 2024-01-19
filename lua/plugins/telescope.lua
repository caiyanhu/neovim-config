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
    },
    keys = {
      { '<leader>?', "<CMD>lua require('telescope.builtin').oldfiles()<CR>" },
      {
        '<leader><space>',
        "<CMD>lua require('telescope.builtin').buffers({ sort_mru = true })<CR>",
      },
      {
        '<leader>/',
        function()
          -- find in current buffer
          require('telescope.builtin').current_buffer_fuzzy_find(
            require('telescope.themes').get_dropdown {
              winblend = 10,
              previewer = false,
            }
          )
        end,
      },
      { '<leader>f', "<CMD>lua require('telescope.builtin').find_files()<CR>" },
      { '<C-p>', "<CMD>lua require('telescope.builtin').find_files()<CR>" },
      { '<leader>g', "<CMD>lua require('telescope.builtin').live_grep()<CR>" },
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
    end,
  },
}
