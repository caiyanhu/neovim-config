return {

  {
    'dcampos/cmp-emmet-vim',
    dependencies = {
      'mattn/emmet-vim',
      cond = not vim.g.vscode,
      event = 'VeryLazy',
      config = function()
        -- enable all function in all mode
        vim.g.user_emmet_mode = 'a'
      end,
    },
  },
}
