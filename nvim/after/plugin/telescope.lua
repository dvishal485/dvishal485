local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- with sort_lastused=true
vim.keymap.set('n', '<Tab>', function()
        builtin.buffers({ sort_lastused = true });
    end,
    { silent = true, noremap = true })

vim.keymap.set("n", "<C-f>", builtin.current_buffer_fuzzy_find, { silent = true, noremap = true })

vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Search > ") });
end)
