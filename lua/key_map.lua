-- Options
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- normal_mode = "n", insert_mode = "i", visual_mode = "v"
-- visual_block_mode = "x", term_mode = "t", command_mode = "c"

-- ====================== Normal ======================
-- Better window navigation
vim.keymap.set("n", "<M-h>", "<C-w>h", opts)
vim.keymap.set("n", "<M-j>", "<C-w>j", opts)
vim.keymap.set("n", "<M-k>", "<C-w>k", opts)
vim.keymap.set("n", "<M-l>", "<C-w>l", opts)

vim.keymap.set("n", "<BS>", ":nohlsearch<CR>", opts)

-- Cursor position
vim.keymap.set("n", "<S-h>", "^", opts)
vim.keymap.set("n", "<S-l>", "$", opts)

-- Buffers
vim.keymap.set("n", "<F5>", "<cmd>edit!<cr>", opts)
-- close all buffers except the current one
vim.keymap.set("n", "<leader>bo", ":BufOnly<cr>", opts)

-- Disable normal macro record
vim.keymap.set("n", "q", "", opts)
vim.keymap.set("n", "Q", "q", opts)

-- ====================== Insert ======================
vim.keymap.set("i", "<M-o>", "<Esc>o", opts)
vim.keymap.set("i", "<M-O>", "<Esc>O", opts)
vim.keymap.set("i", "<C-a>", "<HOME>", opts)
vim.keymap.set("i", "<C-e>", "<END>", opts)
vim.keymap.set("i", "<C-c>", "<Esc>", opts)
-- Move lines
vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
vim.keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)

-- ====================== Visual ======================
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move lines
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- ====================== Visual Block ======================
-- Move text up and down
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- ====================== Terminal ======================
-- Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
