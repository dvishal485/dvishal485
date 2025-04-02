vim.keymap.set("n", "<leader>pv", "<cmd>lua require('telescope.builtin').find_files()<CR>",
    { silent = true, noremap = true }
)

vim.keymap.set("v", ":y", '"+y',
    { silent = true, noremap = true }
)

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-z>', '<cmd>:ToggleTerm<CR>', opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.keymap.set("n", "<C-z>", "<cmd>ToggleTerm<CR>", { silent = true, noremap = true })

vim.keymap.set("n", ":Q", "<cmd>q<CR>", { silent = true, noremap = true })
vim.keymap.set("n", ":W", "<cmd>w<CR>", { silent = true, noremap = true })
--[[ vim.keymap.set("n", "<C-z>", "<cmd>:below :new +term<CR>i", { silent = true, noremap = true })
vim.keymap.set("i", "<C-z>", "<cmd>:below :new +term<CR>i", { silent = true, noremap = true }) ]]
vim.keymap.set("n", ":Pa", "<cmd>PackerSync<CR>")

vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap('n', '<leader>bd', '<cmd>BufferLinePickClose<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-_>', '<leader>cc', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<C-_>', '<Esc><leader>cca', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', '<C-_>', '<leader>b<cmd>a', { noremap = false, silent = true })

-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<CR>",
    { silent = true, noremap = true }
)

vim.keymap.set("n", "<C-h>", "<cmd>HopWord<CR>",
    { silent = true, noremap = true }
)
-- file exp
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<M-w>", "<C-w><C-w>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<C-m>", "<C-w>-",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<C-p>", "<C-w>+",
    { silent = true, noremap = true }
)

-- vim.keymap.set("i", "<Home>", "<Esc>^i", { silent = true, noremap = true })
-- vim.keymap.set("n", "<Home>", "^", { silent = true, noremap = true })
-- vim.keymap.set("i", "<S-Home>", "<Esc>v<Home>", { silent = true, noremap = true })
-- vim.keymap.set("i", "<S-End>", "<Esc>v<End>", { silent = true, noremap = true })


vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv")

vim.keymap.set("i", "<M-Down>", "<cmd>:m+<CR>")
vim.keymap.set("i", "<M-Up>", "<cmd>:m-2<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("n", "<C-s>", "<Esc>:w<CR>")


vim.api.nvim_set_keymap('', '<Leader>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>p', '"+p', { noremap = true, silent = true })
