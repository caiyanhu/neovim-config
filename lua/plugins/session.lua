return {
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = vim.log.levels.ERROR,
        auto_session_enable_last_session = false,
        auto_session_last_session_dir = vim.fn.stdpath 'data' .. '/sessions/',
        auto_session_root_dir = vim.fn.stdpath 'data' .. '/sessions/',
        auto_session_enabled = true,
        auto_save_enabled = false,
        auto_restore_enabled = true,
        auto_session_use_git_branch = false,
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      }

      vim.keymap.set(
        'n',
        '<leader>ls',
        require('auto-session.session-lens').search_session,
        {
          noremap = true,
        }
      )
    end,
  },
}
