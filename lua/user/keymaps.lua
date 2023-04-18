local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<M-h>", "<C-w>h", opts)
keymap("n", "<M-j>", "<C-w>j", opts)
keymap("n", "<M-k>", "<C-w>k", opts)
keymap("n", "<M-l>", "<C-w>l", opts)

keymap("n", "<BS>", ":nohlsearch<CR>", opts)
keymap("n", "L", "$", opts)
keymap("n", "H", "^", opts)
keymap("n", "Q", "q", opts)
keymap("n", "q", "<Nop>", opts)
keymap("n", "Y", "y$", opts)
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Insert --
keymap("i", "<M-o>", "<Esc>o", opts) -- open next line with insert mode
keymap("i", "<C-a>", "<HOME>", opts)
keymap("i", "<C-e>", "<END>", opts)
keymap("i", "<C-c>", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
keymap("n", "<M-`>", ":FloatermToggle<cr>", opts)
keymap("i", "<M-`>", "<Esc>:FloatermToggle<cr>", opts)
keymap("t", "<M-`>", "<C-\\><C-n>:FloatermToggle<cr>", term_opts)
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap(
	"n",
	"<C-p>",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<CR>",
	opts
)
keymap("n", "<leader>ff", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<CR>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- LSP saga
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]E", "<cmd>lua require'lspsaga.diagnostic'.goto_next({ severity = vim.diagnostic.severity.ERROR })", opts)
keymap("n", "[E", "<cmd>lua require'lspsaga.diagnostic'.goto_prev({ severity = vim.diagnostic.severity.ERROR })", opts)
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", ">d", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- qf.nvim
keymap("n", "<leader>lo", "<cmd>lua require'qf'.open('l')<CR>", opts) -- Open location list
keymap("n", "<leader>lc", "<cmd>lua require'qf'.close('l')<CR>", opts) -- Close location list
keymap("n", "<leader>lt", "<cmd>lua require'qf'.toggle('l', true)<CR>", opts) -- Toggle location list and stay in current window
keymap("n", "<leader>j", "<cmd>lua require'qf'.below('l', true)<CR>", opts) -- Go to next location list entry from cursor
keymap("n", "<leader>k", "<cmd>lua require'qf'.above('l', true)<CR>", opts) -- Go to previous location list entry from cursor

keymap("n", "<leader>co", "<cmd>lua require'qf'.open('c')<CR>", opts) -- Open quickfix list
keymap("n", "<leader>cc", "<cmd>lua require'qf'.close('c')<CR>", opts) -- Close quickfix list
keymap("n", "<leader>ct", "<cmd>lua require'qf'.toggle('c', true)<CR>", opts) -- Toggle quickfix list and stay in current window
keymap("n", "<leader>J", "<cmd>lua require'qf'.below('c', true)<CR>", opts) -- Go to next quickfix entry from cursor
keymap("n", "<leader>K", "<cmd>lua require'qf'.above('c', true)<CR>", opts) -- Go to previous quickfix entry from cursor

keymap("n", "]q", "<cmd>lua require'qf'.below('visible')<CR>", opts) -- Go to next entry from cursor in visible list
keymap("n", "[q", "<cmd>lua require'qf'.above('visible')<CR>", opts) -- Go to previous entry from cursor in visible list

-- todo-comments
keymap("n", "]t", "<cmd>lua require'todo-comments'.jump_next()<CR>", opts) -- Go to next entry from cursor in visible list
keymap("n", "[t", "<cmd>lua require'todo-comments'.jump_prev()<CR>", opts) -- Go to previous entry from cursor in visible list
keymap("n", "<leader>ft", "<cmd>TodoTelescope<CR>", opts)

-- nvim-dap
keymap("n", "<leader>dd", "<cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)

-- diffview
keymap("n", "]x", "<cmd>lua require'diffview.actions'.prev_conflict()<CR>", opts)
keymap("n", "[x", "<cmd>lua require'diffview.actions'.next_conflict()<CR>", opts)
keymap("n", "<leader>co", "<cmd>lua require'diffview.actions'.conflict_choose('ours')<CR>", opts)
keymap("n", "<leader>ct", "<cmd>lua require'diffview.actions'.conflict_choose('theirs')<CR>", opts)
keymap("n", "<leader>cb", "<cmd>lua require'diffview.actions'.conflict_choose('base')<CR>", opts)
keymap("n", "<leader>ca", "<cmd>lua require'diffview.actions'.conflict_choose('all')<CR>", opts)
keymap("n", "<leader>c0", "<cmd>lua require'diffview.actions'.conflict_choose('none')<CR>", opts)
keymap("n", "<leader>-", "<cmd>lua require'diffview.actions'.toggle_stage_entry()<CR>", opts)
keymap("n", "<leader>S", "<cmd>lua require'diffview.actions'.stage_all()<CR>", opts)
keymap("n", "<leader>U", "<cmd>lua require'diffview.actions'.unstage_all()<CR>", opts)
keymap("n", "<leader><CR>", "<cmd>lua require'diffview.actions'.select_entry()<CR>", opts)
keymap("n", "<leader>X", "<cmd>lua require'diffview.actions'.restore_entry()<CR>", opts)
keymap("n", "<leader>dv", ":DiffviewOpen<CR>", opts)

-- bookmarks
keymap("n", "mm", ":BookmarkToggle<CR>", opts)
keymap("n", "mi", ":BookmarkAnnotate", opts)
keymap("n", "mn", ":BookmarkNext<CR>", opts)
keymap("n", "mp", ":BookmarkPrev<CR>", opts)
keymap("n", "ma", ":BookmarkShowAll<CR>", opts)
keymap("n", "mc", ":BookmarkClear<CR>", opts)
keymap("n", "mx", ":BookmarkClearAll<CR>", opts)

-- ufo
keymap("n", "zR", "<cmd>lua require'ufo'.openAllFolds()<CR>", opts)
keymap("n", "zM", "<cmd>lua require'ufo'.closeAllFolds()<CR>", opts)
