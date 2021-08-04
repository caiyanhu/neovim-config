-- map leader to space
vim.g.mapleader = ' '

local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require('settings')

-- Auto install packer.nvim if not exits
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Install plugins
require('plugins')

-- Key mappings
require('keymappings')

-- Group configuration in one folder
require('config')

-- Init Auto Pairs
require('nvim-autopairs').setup()

-- Init Color Highlighter
require('colorizer').setup()

-- LSP Configuration
vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
        return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.api.nvim_command("noautocmd :update")
        end
    end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = true,
        signs = true,
        update_in_insert = true
    }
)

local on_attach = function(client)
    if client.name ~= 'efm' then
        client.resolved_capabilities.document_formatting = false
    end

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits'
    }
}

local function eslint_config_exists()
    local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

    if not vim.tbl_isempty(eslintrc) then
        return true
    end

    if vim.fn.filereadable("package.json") then
        if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
            return true
        end
    end

    return false
end

local formatConfig = require('format')
local servers = {
    efm = {
        init_options = {documentFormatting = true, codeAction = true},
        root_dir = function()
            if not eslint_config_exists() then
                return nil
            end
            return vim.fn.getcwd()
        end,
        settings = {
            languages = formatConfig
        },
        filetypes = vim.tbl_keys(formatConfig)
    },
    "tsserver",
    "vuels"
}


local lspConfig = require('lspconfig')
local lspInstall = require('lspinstall')
local function setup_servers()
    lspInstall.setup()
    local installed = lspInstall.installed_servers()
    for _, server in pairs(installed) do
        local config = servers[server] or {root_dir = lspConfig.util.root_pattern({'./git/', '.'})}
        config.capabilities = capabilities
        config.on_attach = on_attach
        lspConfig[server].setup(config)
    end
end

setup_servers()
