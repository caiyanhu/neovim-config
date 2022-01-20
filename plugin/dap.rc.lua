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

dap.configurations.typescript = {
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

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/tools/vscode-chrome-debug/out/src/chromeDebug.js"} -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

dap.configurations.typescriptreact = { -- change to typescript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

local utils = require('utils')
utils.map('n', '<F5>', ':lua require("dap").continue()<CR>', {silent = true})
utils.map('n', '<F10>', ':lua require("dap").step_over()<CR>', {silent = true})
utils.map('n', '<F11>', ':lua require("dap").step_into()<CR>', {silent = true})
utils.map('n', '<F12>', ':lua require("dap").step_out()<CR>', {silent = true})
utils.map('n', '<leader>dt', ':lua require("dap").toggle_breakpoint()<CR>', {silent = true})
utils.map('n', '<leader>dc', ':lua require("dap").clear_breakpoints()<CR>', {silent = true})

vim.fn.sign_define('DapBreakpoint', {text = '🔴', texthl = '', linehl = '', numhl = ''});
vim.fn.sign_define('DapStopped', {text = '👉', texthl = '', linehl = '', numhl = ''});
vim.fn.sign_define('DapBreakpointRejected', {text = '⛔', texthl = '', linehl = '', numhl = ''});

