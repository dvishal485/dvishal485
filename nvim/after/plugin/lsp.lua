local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'lua_ls',
    'rust_analyzer',
    'clangd',
    'pyright',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil,
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.format_mapping('gq', {
    format_opts = {
        async = true,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['clangd'] = { 'c', 'cpp' },
        ['pyright'] = { 'python' },
        ['black'] = { 'python' },
    }
})

local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
    cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--header-insertion=never',
        '--completion-style=bundled',
        '--suggest-missing-includes',
    },
})
lspconfig.rust_analyzer.setup({
    flags = {
        exit_timeout = 0,
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>en", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>ep", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<C-l>", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)

    -- this is cursed, i thought C-i is Ctrl+i but it is actually equivalent to Tab
    -- vim.keymap.set("i", "<C-i>", function() vim.lsp.buf.completion() end, opts)

    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>fq", "<cmd>LspZeroFormat<CR>")

    -- Automatically format code on save
    -- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({async = false})]]

    -- Automatically set up rust environment variables
    vim.cmd("autocmd FileType rust let g:rust_env_vars = system('cat .env')")
end)



--[[ vim.diagnostic.config({
    virtual_text = true
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        prefix = ">",
        spacing = 2,
    },
})

vim.lsp.handlers["textDocument/inlayHints"] = vim.lsp.with(vim.lsp.handlers.inlay_hints, {
    highlight = "Comment",
    prefix = " > ",
    aligned = false,
    enabled = true,
    only_current_line = false,
}) ]]
lsp.setup()
