require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "cpp", "c", "lua", "rust", "typescript", "vim" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
