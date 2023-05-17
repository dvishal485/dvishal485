vim.keymap.set("n", "<leader>pv", "<cmd>lua require('telescope.builtin').find_files()<CR>",
    { silent = true, noremap = true }
)

vim.keymap.set("n", ":Q", "<cmd>q<CR>", { silent = true, noremap = true })
vim.keymap.set("n", ":W", "<cmd>w<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-z>", "<cmd>:below :new +term<CR>i", { silent = true, noremap = true })
vim.keymap.set("i", "<C-z>", "<cmd>:below :new +term<CR>i", { silent = true, noremap = true })
vim.keymap.set("n", ":Pa", "<cmd>PackerSync<CR>")

vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true

vim.api.nvim_set_keymap('n', '<C-_>', '<leader>cc', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<C-_>', '<Esc><leader>cca', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', '<C-_>', '<leader>b<cmd>a', { noremap = false, silent = true })

-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<CR>",
    { silent = true, noremap = true }
)

-- LSP
vim.keymap.set("i", "<C-l>", "<cmd>lua vim.lsp.buf.code_action()<CR>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<C-l>", "<cmd>lua vim.lsp.buf.code_action()<CR>",
    { silent = true, noremap = true }
)

-- file exp
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<M-w>", "<C-w><C-w>",
    { silent = true, noremap = true }
)

vim.keymap.set("i", "<S-Home>", "<Esc>v<Home>", { silent = true, noremap = true })
vim.keymap.set("i", "<S-End>", "<Esc>v<End>", { silent = true, noremap = true })


vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv")

vim.keymap.set("i", "<M-Up>", "<cmd>:m-2<CR>gi")
vim.keymap.set("i", "<M-Down>", "<cmd>:m+<CR>gi")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("n", "<C-s>", "<Esc>:w<CR>")


vim.api.nvim_set_keymap('', '<Leader>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>p', '"+p', { noremap = true, silent = true })
