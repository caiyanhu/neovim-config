local utils = require('utils')

utils.map('n', '<F5>', '<cmd>lua require"dap".continue()<CR>') 
utils.map('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>') 
utils.map('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>') 
utils.map('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>') 
utils.map('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>') 
utils.map('n', '<leader>dsbc', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>') 
utils.map('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>') 
utils.map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>') 
utils.map('n', '<leader>drl', '<cmd>lua require"dap".epl.run_last()<CR>')

-- telescope-dap
utils.map('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
utils.map('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
utils.map('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
utils.map('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
utils.map('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')


local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/tools/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}
